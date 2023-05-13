package erp.truongsonwood.hsv_sms_handle;


import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.AlertDialogLayout;
import androidx.core.app.ActivityCompat;

import android.Manifest;

import android.app.AlertDialog;
import android.app.DatePickerDialog;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.telephony.SmsManager;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;

import android.widget.Toast;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


public class MainActivity extends AppCompatActivity {
    private static final int MY_PERMISSION_REQUEST_CODE_SEND_SMS = 1;
    private static final int MY_PERMISSION_REQUEST_CODE_READ_SMS = 2;
    private static final String LOG_TAG = "AndroidExample";
    private EditText editFiter;
    private Button buttonShow,startDate,endDate;;
    private String[] strFiter;
    private Context context;
    private long _startDate,_endDate;
    private Date date;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        this.buttonShow=(Button) findViewById(R.id.button_show);
        this.editFiter=(EditText)findViewById(R.id.editFilter);

        this.startDate=(Button) findViewById(R.id.startDate);
        this.endDate=(Button)findViewById(R.id.endDate);


        this.context= this;
        this.buttonShow.setOnClickListener(new View.OnClickListener() {
            @RequiresApi(api = Build.VERSION_CODES.M)
            @Override
            public void onClick(View v) {
                String s = editFiter.getText().toString();

                    strFiter = editFiter.getText().toString().split(",");
                    askPermissionAndReadSMS();
            }
        });



        startDate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                date = new Date();

                _startDate=chonngay(date);
            }

                });
        endDate.setOnClickListener(new View.OnClickListener()  {
            @Override
            public void onClick(View v) {
                date = new Date();
                _endDate=chonngay(date);

            }


        });


    }

    private long chonngay(Date date)
    {

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int year = calendar.get(Calendar.YEAR);
        int day = calendar.get(Calendar.DATE);
        int month= calendar.get(Calendar.MONTH);
        DatePickerDialog datePickerDialog= new DatePickerDialog(this,new DatePickerDialog.OnDateSetListener() {
            @Override
            public void onDateSet(DatePicker view, int year, int month, int dayOfMonth) {
                calendar.set(year,month,dayOfMonth);

            }
        },year,month,day);

        datePickerDialog.show();
        return calendar.getTime().getTime();
    }
    @RequiresApi(api = Build.VERSION_CODES.M)
    private void askPermissionAndReadSMS()
    {
        if(Build.VERSION.SDK_INT>=Build.VERSION_CODES.KITKAT)
        {
            int readSMSPermisson = ActivityCompat.checkSelfPermission(this,Manifest.permission.READ_SMS);
            if(readSMSPermisson != PackageManager.PERMISSION_GRANTED){
                this.requestPermissions(
                        new String[]{Manifest.permission.READ_SMS}, MY_PERMISSION_REQUEST_CODE_READ_SMS
                );
                return;
            }
        }
        this.readSMS();
    }

    private void readSMS() {

       Intent i = new Intent(this, SMS_Reader_Activity.class);
        i.putExtra("strFilter",strFiter);
        i.putExtra("startDate", _startDate);
        i.putExtra("endDate",_endDate);
       startActivity(i);
    }

    private void askPermissionAndSendSMS() {
        if(Build.VERSION.SDK_INT>=Build.VERSION_CODES.M){
            int sendSmsPermisson  = ActivityCompat.checkSelfPermission(this, Manifest.permission.SEND_SMS);
            if(sendSmsPermisson != PackageManager.PERMISSION_GRANTED){
                this.requestPermissions(
                        new String[]{Manifest.permission.SEND_SMS}, MY_PERMISSION_REQUEST_CODE_SEND_SMS
                );
                return;
            }

        }

        this.sendSMS_by_smsManager();
    }
    private void sendSMS_by_smsManager()
    {
        String phoneNumber = this.editFiter.getText().toString();
        String messenger = this.editFiter.getText().toString();
        try{
            SmsManager smsManager=  SmsManager.getDefault();
            smsManager.sendTextMessage(phoneNumber,null,messenger,null,null);
            Log.i( LOG_TAG,"Your sms has successfully sent!");
            Toast.makeText(getApplicationContext(),"Your sms has successfully sent!",
                    Toast.LENGTH_LONG).show();
        }
        catch (Exception ex)
        {
            Log.e( LOG_TAG,"Your sms has failed...", ex);
            Toast.makeText(getApplicationContext(),"Your sms has failed... " + ex.getMessage(),
                    Toast.LENGTH_LONG).show();
            ex.printStackTrace();
        }

    }

    @Override
    public void onRequestPermissionsResult(int requestCode,  String[] permissions,  int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);

        switch (requestCode) {

            case MY_PERMISSION_REQUEST_CODE_SEND_SMS: {

                // Note: If request is cancelled, the result arrays are empty.
                // Permissions granted (SEND_SMS).
                if (grantResults.length > 0
                        && grantResults[0] == PackageManager.PERMISSION_GRANTED) {

                    Log.i(LOG_TAG, "Permission granted!");
                    Toast.makeText(this, "Permission granted!", Toast.LENGTH_LONG).show();

                    this.sendSMS_by_smsManager();
                }
                // Cancelled or denied.
                else {
                    Log.i(LOG_TAG, "Permission denied!");
                    Toast.makeText(this, "Permission denied!", Toast.LENGTH_LONG).show();
                }}
                break;
                case MY_PERMISSION_REQUEST_CODE_READ_SMS:{
                    if (grantResults.length > 0 & grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                        Log.i(LOG_TAG, "Permission granted!");
                        Toast.makeText(this,"Permission granted!", Toast.LENGTH_LONG).show();
                        this.readSMS();
                    }else
                    {
                        Log.i(LOG_TAG, "Permission denied!");
                        Toast.makeText(this, "Permission denied!", Toast.LENGTH_LONG).show();
                    }
                }
                break;
            }
        }


    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if(requestCode==MY_PERMISSION_REQUEST_CODE_SEND_SMS)
        {
            if(requestCode==RESULT_OK)
            {
                Toast.makeText(this,"ACTION OK", Toast.LENGTH_SHORT).show();
            }else if (resultCode== RESULT_CANCELED)
            {
                Toast.makeText(this,"ACTION CANCELED", Toast.LENGTH_SHORT).show();
            }else {
                Toast.makeText(this, "Faild", Toast.LENGTH_SHORT).show();
            }
        }
    }

}