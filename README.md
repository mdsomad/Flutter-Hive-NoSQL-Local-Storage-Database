# Flutter Hive NoSQL Local Storage Database

A new Flutter project.

## Getting Started

- First Add This Package
```sh
hive: ^2.2.3
```
- Run this command
```sh
flutter pub add hive
```
- Second Add This Package
```sh
path_provider: ^2.0.15
```
- Run this command
```sh
flutter pub add path_provider
```


- thard Add This Package
```sh
hive_flutter: ^1.1.0
```
- Run this command
```sh
flutter pub add hive_flutter
```




- Add this Package dev_dependencies
```sh
hive_generator: ^2.0.0
build_runner: any
```



Then Add This Permissions android/app/src/main/AndroidManifest.xml file:
```sh 
 <uses-permission
        android:name="android.permission.MANAGE_EXTERNAL_STORAGE" />
 <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
 <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
```




- build_runner Model generator command
```sh
flutter pub run build_runner build
```







## Hive Database Notes App Ui Preview


<table>
  
  
<tr>                    
   <th>Notes App Data Add view</th>
   <th>Notes App Data Show view</th>
</tr>  
  
  
  
<tr>

<td>
  <img src="https://github.com/mdsomad/Flutter-Hive-NoSQL-Local-Storage-Database/assets/103892160/2cc2ff8d-7c24-4d3c-b8ce-21a3a90155f5" alt=">Note App Data Add" width="260"/>
</td>

<td>
 <img src="https://github.com/mdsomad/Flutter-Hive-NoSQL-Local-Storage-Database/assets/103892160/8d156fcd-552b-4d9d-9203-02e9093cdf31" alt="Note App Data Show" width="260"/>
</td>


  
</tr>

</table>











