package com.lynn.album;
import com.lynn.album.PhotoUpImageBucket;
import com.lynn.album.PhotoUpImageItem;
import com.lynn.album.PhotoUpAlbumHelper;
import com.lynn.album.PhotoUpAlbumHelper.GetAlbumList;
import java.util.ArrayList;
import java.util.List;
import android.os.Bundle;
import android.util.Log;
import org.qtproject.qt5.android.bindings.QtActivity;

public class MainActivity extends org.qtproject.qt5.android.bindings.QtActivity
{
    private static MainActivity m_instance;
    private PhotoUpAlbumHelper photoUpAlbumHelper;
    private static List<PhotoUpImageBucket> albumList;

    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        Log.i("++++++++++onCreate()++++++++","11111");
        loadData();
    }

    /**
     * 初始化获取相册目录
     */
    private void loadData(){
        try{
            Log.i("++++++++++loadData()++++++++","11111");
            photoUpAlbumHelper = PhotoUpAlbumHelper.getHelper();
            photoUpAlbumHelper.init(MainActivity.this);
            photoUpAlbumHelper.setGetAlbumList(new GetAlbumList() {
                    @Override
                    public void getAlbumList(List<PhotoUpImageBucket> list) {

                        Log.i("++++++++++loadData()++list++++++","2222");
                        MainActivity.this.albumList = list;
                    }
            });
            photoUpAlbumHelper.execute(false);
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static String getPhotoAlbumInfo(){
        String photoAlbumInfo = "";
        try{
            for(int i = 0 ; i < albumList.size() ; ++i){
                List<PhotoUpImageItem> imageList = albumList.get(i).getImageList();
                int imageNum = imageList.size();//相册中相片数量
                String firstImagePath = imageList.get(imageNum-1).getImagePath();//第一张相片的路径
                photoAlbumInfo += firstImagePath + ";" + String.valueOf(imageNum) + "#";
            }
        }catch (Exception e) {
            e.printStackTrace();
        }

        return photoAlbumInfo;
    }
}
