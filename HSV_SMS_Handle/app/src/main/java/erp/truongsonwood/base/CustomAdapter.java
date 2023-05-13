package erp.truongsonwood.base;

import android.content.Context;
import android.graphics.Color;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import erp.truongsonwood.hsv_sms_handle.R;

public class CustomAdapter extends RecyclerView.Adapter<CustomAdapter.ViewHolder>
{
    private ArrayList<Item_SMS> item_smsArrayList;
    private Context context;

    public CustomAdapter(ArrayList<Item_SMS> item_smsArrayList, Context context) {
        this.item_smsArrayList = item_smsArrayList;
        this.context = context;

    }

    @NonNull
    @Override
    public CustomAdapter.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_sms, parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull CustomAdapter.ViewHolder holder, int position) {
        Item_SMS item_sms = item_smsArrayList.get(position);
        holder.sms_address.setText(item_sms.getsms_address());
        holder.sms_desciption.setText(item_sms.getSms_description());
        holder.sms_donvi.setText(item_sms.getSms_donvi());
        holder.setItemClickListener(new ItemClickListener() {
            @Override
            public void onClick(View view, int pois, boolean isLongClick) {
                if (isLongClick)
                    view.setBackgroundColor(Color.GRAY);
                else
                    Toast.makeText(context, " " + item_smsArrayList.get(pois).getsms_address(), Toast.LENGTH_SHORT).show();

            }
        });
    }

    @Override
    public int getItemCount() {
        return item_smsArrayList.size();
    }


    public void filterList(ArrayList<Item_SMS> filterList) {

        Collections.sort(filterList, new Comparator<Item_SMS>() {
            @Override
            public int compare(Item_SMS o1, Item_SMS o2) {
                if (o1.getsms_longDate() < o2.getsms_longDate()) {
                    return 1;
                }
                return -1;

            }
        });
        item_smsArrayList = filterList;
        notifyDataSetChanged();
    }




    public class ViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener, View.OnLongClickListener
    {
        private TextView sms_desciption, sms_address, sms_donvi;
        private ItemClickListener itemClickListener;

        public ViewHolder(@NonNull View itemView) {
            super(itemView);
            sms_address = itemView.findViewById(R.id.sms_address);
            sms_desciption = itemView.findViewById(R.id.sms_description);
            sms_donvi = itemView.findViewById(R.id.sms_donvi);
            itemView.setOnClickListener(this);
            itemView.setOnLongClickListener(this);
        }

        public void setItemClickListener(ItemClickListener itemClickListener) {
            this.itemClickListener = itemClickListener;
        }

        @Override
        public void onClick(View v) {
            itemClickListener.onClick(v, getAdapterPosition(), false);

        }

        @Override
        public boolean onLongClick(View v) {
            itemClickListener.onClick(v, getAdapterPosition(), true);
            return true;
        }
    }

}
