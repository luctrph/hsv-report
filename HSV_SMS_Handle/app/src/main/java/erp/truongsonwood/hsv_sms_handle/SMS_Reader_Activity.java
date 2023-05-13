package erp.truongsonwood.hsv_sms_handle;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.SearchView;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.annotation.SuppressLint;
import android.content.ContentResolver;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.widget.TextView;

import java.util.ArrayList;

import erp.truongsonwood.base.CustomAdapter;
import erp.truongsonwood.base.Item_SMS;
import erp.truongsonwood.base.SMS_Const;

public class SMS_Reader_Activity extends AppCompatActivity {
    private RecyclerView smsRV;
    private CustomAdapter adapter;
    private ArrayList<Item_SMS> item_smsArrayList, filterlist;
    private TextView txtCount;
    private String[] sotk_ts, sotk_lh, sotk_thuysan, sotk_vh, sotk_namthanh, strFilter;
    private String TAG_LOG = "SMS handle";


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sms_read);
        smsRV = findViewById(R.id.idSMSRV);
        txtCount = findViewById(R.id.sms_count);
        sotk_ts = getResources().getStringArray(R.array.truong_son);
        sotk_thuysan = getResources().getStringArray(R.array.thuy_san);
        sotk_vh = getResources().getStringArray(R.array.viet_hung);
        sotk_namthanh = getResources().getStringArray(R.array.nam_thanh);
        sotk_lh = getResources().getStringArray(R.array.long_hai);


        Bundle bundle = getIntent().getExtras();

        if (bundle != null) {
            strFilter = bundle.getStringArray("strFilter");
        }
        buildRecyclerView();
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.search_menu, menu);
        MenuItem searchItem = menu.findItem(R.id.actionSearch);
        SearchView searchView = (SearchView) searchItem.getActionView();
        searchView.setOnQueryTextListener(new SearchView.OnQueryTextListener() {
            @Override
            public boolean onQueryTextSubmit(String query) {
                return false;
            }

            @Override
            public boolean onQueryTextChange(String newText) {
                filter(newText);

                return false;
            }
        });
        return true;
    }

    private void filter(String newText) {
        filterlist = new ArrayList<>();
        for (Item_SMS item : item_smsArrayList) {
            if (item.getSms_description().toLowerCase().contains(newText.toLowerCase()) ||
                    item.getsms_address().toLowerCase().contains(newText.toLowerCase()) ||
                    (item.getSms_donvi() != null && item.getSms_donvi().toLowerCase().contains(newText.toLowerCase()))

            ) {
                filterlist.add(item);
            }
        }
        if (filterlist.isEmpty()) {
            filterlist.clear();
            adapter.filterList(filterlist);

        } else {
            adapter.filterList(filterlist);

        }
        txtCount.setText(String.valueOf(filterlist.size()));

    }

    private void buildRecyclerView() {
        item_smsArrayList = getAllSms();
        ArrayList<Item_SMS> selectionSMS = item_smsArrayList;
        //  item_smsArrayList = null;
        adapter = new CustomAdapter(selectionSMS,
                SMS_Reader_Activity.this);

        LinearLayoutManager manager = new LinearLayoutManager(this);
        smsRV.setHasFixedSize(true);
        smsRV.setLayoutManager(manager);
        smsRV.setAdapter(adapter);
        txtCount.setText(String.valueOf(selectionSMS.size()));


    }

    private ArrayList<Item_SMS> sortSMS(ArrayList<Item_SMS> smsArrayList) {
        ArrayList<Item_SMS> lsSMS = new ArrayList<>();
        String header = "";
        for(int i = 0; i < smsArrayList.size(); i++)
        {
            if(!(header.equals(smsArrayList.get(i).getDate()))) {
                Item_SMS item_sms= new Item_SMS();
                item_sms.setSectionHeader();
                lsSMS.add(item_sms);
                header = smsArrayList.get(i).getDate();
            }
            lsSMS.add(smsArrayList.get(i));
        }
        return lsSMS;
    }

    @SuppressLint("Range")
    public ArrayList<Item_SMS> getAllSms() {
        ArrayList<Item_SMS> lstSms = new ArrayList<>();
        Uri message = Uri.parse("content://sms/");
        ContentResolver cr = this.getContentResolver();
        Cursor c = cr.query(message, null, null, null, null);
        this.startManagingCursor(c);
        int totalSMS = c.getCount();

        if (c.moveToFirst()) {
            for (int i = 0; i < totalSMS; i++) {
                if (c.getString(c.getColumnIndexOrThrow(SMS_Const.type)).contains("1")) {
                    for (String s : strFilter) {
                        Item_SMS objSms = new Item_SMS(c.getString(c.getColumnIndexOrThrow(SMS_Const.body)),
                                c.getString(c.getColumnIndexOrThrow(SMS_Const.address)),
                                c.getInt(c.getColumnIndexOrThrow(SMS_Const.id)),
                                c.getLong(c.getColumnIndexOrThrow(SMS_Const.date))
                        );

                        for (String item : sotk_ts) {
                            if (objSms.getSms_description().toLowerCase().contains(item.toLowerCase())) {
                                objSms.setSms_donvi("Truong Son");
                                break;
                            }
                        }
                        for (String item : sotk_thuysan) {
                            if (objSms.getSms_description().toLowerCase().contains(item.toLowerCase())) {
                                objSms.setSms_donvi("Thuy San");
                                break;
                            }
                        }
                        for (String item : sotk_thuysan) {
                            if (objSms.getSms_description().toLowerCase().contains(item.toLowerCase())) {
                                objSms.setSms_donvi("Thuy San");
                                break;
                            }
                        }
                        for (String item : sotk_namthanh) {
                            if (objSms.getSms_description().toLowerCase().contains(item.toLowerCase())) {
                                objSms.setSms_donvi("Nam Thanh");
                                break;
                            }
                        }
                        for (String item : sotk_lh) {
                            if (objSms.getSms_description().toLowerCase().contains(item.toLowerCase())) {
                                objSms.setSms_donvi("Long Hai");
                                break;
                            }
                        }
                        for (String item : sotk_vh) {
                            if (objSms.getSms_description().toLowerCase().contains(item.toLowerCase())) {
                                objSms.setSms_donvi("Viet Hung");
                                break;
                            }
                        }
                        Log.d(TAG_LOG+"----------",objSms.getDate());
                        lstSms.add(objSms);
                    }
                }

                c.moveToNext();
            }

        }
        c.close();
        return lstSms;
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        if (filterlist != null) {
            filterlist = null;
        }
        if (item_smsArrayList != null) {
            item_smsArrayList = null;
            Log.d(TAG_LOG, "clear all");
        }
        sotk_ts = null;
        sotk_lh = null;
        sotk_thuysan = null;
        sotk_vh = null;
        sotk_namthanh = null;
    }
}