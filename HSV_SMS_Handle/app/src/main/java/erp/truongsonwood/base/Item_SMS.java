package erp.truongsonwood.base;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Item_SMS {
    private String sms_description;
    private String sms_address;
    private String sms_folder;
    private String sms_donvi;
    private long sms_longDate =0;
    private int sms_id;
    private boolean isSectionHeader;


    public boolean isSectionHeader() {
        return isSectionHeader;
    }

    public void setSectionHeader() {
        isSectionHeader = true;
    }

    public String getDate() {
        DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        String sdate = formatter.format(new Date(sms_longDate));
        return sdate;
    }

    public long getsms_longDate() {
        return sms_longDate;
    }

    public Date getDateTime() {
        return new Date(sms_longDate);
    }

    public void setsms_longDate(long sms_longDate) {
        this.sms_longDate = sms_longDate;
    }

    private boolean checked;

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    public int getsms_id() {
        return sms_id;
    }

    public void setsms_id(int sms_id) {
        this.sms_id = sms_id;
    }


    public String getSms_donvi() {
        return sms_donvi;
    }

    public void setSms_donvi(String sms_donvi) {
        this.sms_donvi = sms_donvi;
    }

    public Item_SMS() {

    }

    public Item_SMS(String sms_description, String sms_address, int id, long lDate) {
        this.sms_address = sms_address;
        this.sms_description = sms_description;
        this.sms_longDate = lDate;
        this.sms_id = id;
        isSectionHeader =false;

    }

    public String getSms_description() {
        return sms_description;
    }

    public void setSms_description(String sms_description) {
        this.sms_description = sms_description;
    }

    public String getsms_address() {
        return sms_address;
    }

    public void setsms_address(String sms_address) {
        this.sms_address = sms_address;
    }

    public String getsms_folder() {
        return sms_folder;
    }

    public void setsms_folder(String sms_folder) {
        this.sms_folder = sms_folder;
    }

    public void setToSectionHeader() {
        isSectionHeader = true;
    }


}
