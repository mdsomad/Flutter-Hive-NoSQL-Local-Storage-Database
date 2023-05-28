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
   <th> All Notes Data Show & view</th>
   <th> Old Data Dialog view</th>
   <th> Edited Dialog Data view</th>
   <th> Updated Data view</th>
   <th> Hello Somad Note deleted view</th>
</tr>  
  
  
  
<tr>

<td>
  <img src="https://github.com/mdsomad/Flutter-Hive-NoSQL-Local-Storage-Database/assets/103892160/701620c4-1ec3-436e-923c-94e23e437831" alt=">All Notes Data Show view" width="260"/>
</td>

<td>
 <img src="https://github.com/mdsomad/Flutter-Hive-NoSQL-Local-Storage-Database/assets/103892160/9e9dbd6b-f402-47ab-8c9d-2b32880168ad" alt="Old Data Dialog & view" width="260"/>
</td>


<td>
 <img src="https://github.com/mdsomad/Flutter-Hive-NoSQL-Local-Storage-Database/assets/103892160/14615b58-684f-42a7-9cd2-039f745ab8cb" alt="Edited Dialog Data view" width="260"/>
</td>

<td>
 <img src="https://github.com/mdsomad/Flutter-Hive-NoSQL-Local-Storage-Database/assets/103892160/2e5ac282-9761-41b2-815e-d0a7ba3c8d6b" alt="Updated Data view" width="260"/>
</td>

<td>
 <img src="https://github.com/mdsomad/Flutter-Hive-NoSQL-Local-Storage-Database/assets/103892160/45e7d1ca-c8c3-43c4-b773-0da63eae852b" alt="Hello Somad Note deleted view" width="260"/>
</td>


  
</tr>

</table>




