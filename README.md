# P2_Probstat_E_5025201158

## Perkenalan

Nama                        | Kelas                     |NRP
--------------------------- | ------------------------- | ------------
Michael Ariel Manihuruk     | PROBSTAT E                | 5025201158


## Penjelasan Soal No 1
Tabel :
<br>
![image](https://user-images.githubusercontent.com/89970736/170873936-98b059f8-2f1d-4547-9b32-a7ddb743a5fb.png)
## ==> A
Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas
<br>
Pertama-tama masukkan semua data yang ada pada tabel pada sebuah variabel sebagai berikut
<br>
```c
sebelum <- c(78, 75, 67, 77, 70, 72, 28, 74, 77)
sesudah <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)
```
Kemudian lakukan pengecekan data menggunakan `data.frame` dan lihat hasilnya sebagai berikut
<br>
```c
data <- data.frame(
          group = rep(c("oksigen.sebelum", "oksigen.sesudah"), each = 9),
          saturation = c(sebelum, sesudah)
       )
print(data)
```
![image](https://user-images.githubusercontent.com/89970736/170873599-581f7428-ca3a-48c5-b8b2-538af1bbe9ca.png)
<br>
Setelah itu carilah standar deviasinya sebagai berikut
```c
sd_sebelum <- sd(sebelum)
sd_sebelum

sd_sesudah <- sd(sesudah)
sd_sesudah
```
Dan didapatkan hasilnya sebagai berikut
<br>
![image](https://user-images.githubusercontent.com/89970736/170873797-2ca1843d-3e2b-44d0-8369-fbcb7e028fca.png)
<br>
![image](https://user-images.githubusercontent.com/89970736/170873835-d3c6a97d-1ea1-4ba4-8eb7-75adfe3c4cb5.png)
<br>

## ==> B
Carilah nilai t (p-value)
<br>
Cari nilai t terutama p-value maka bisa menggunakan fungsi `t.test` yaitu sebagai berikut
```c
t.test(sebelum, sesudah, alternative = "greater", var.equal = FALSE)
```
Didapatkan hasi sebagai berikut
<br>
![image](https://user-images.githubusercontent.com/89970736/170874085-bd64de61-6d2d-497e-b3fb-c45b0a240777.png)
<br>

## ==> C
Tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen, sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴”
<br>
Pertama-tama kita lihat hasil kompirasi variabel menggunakan `var.test` sebagai berikut
```c
var.test(sebelum, sesudah)
```
Didapatkan tampilan hasil sebagai berikut
<br>
![image](https://user-images.githubusercontent.com/89970736/170874247-ddc1b574-4e76-4039-9603-a2cc1e8876ba.png)
<br>
Selanjutnya, untuk melihat pengaruh jika tingkat signifikasi 5% dan tidak ada pengaruh yang signifikan secara statistika, maka adalah sebagai berikut
```c
t.test(sebelum, sesudah, mu = 0, alternative = "two.sided", var.equal = TRUE)
```
Didapatkan tampilan hasil sebagai berikut
<br>
![image](https://user-images.githubusercontent.com/89970736/170874372-6708e9a1-83ea-4bde-ba37-9fb57142ec46.png)
<br>
Dapat kita lihat bahwa mean dan convidence sama dengan 1b, yang berbeda adalah p-value dan df. Sehingga tidak memiliki pengaruh yang signifikan secara statistika

## Penjelasan Soal No 2
## ==> A
Apakah Anda setuju dengan klaim tersebut?
<br>
```c
Setuju
```

## ==> B
Jelaskan maksud dari output yang dihasilkan!
<br>
![image](https://user-images.githubusercontent.com/89970736/170874793-fb8d9b41-ed38-495d-9cfe-f74cdbd92f9e.png)
<br>
Diketahui n = 100, Rata-Rata (X̄) = 23500, dan standar deviasi(σ) = 3900, sehingga null hipotesisnya adalah H0 : μ = 20000 dan alternatif hipotesisnya adalah H1 : μ > 20000

## ==> C
Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!
<br>
Setelah dilakukan perhitungan, didapatkan bahwa z = 8.97, dan P-value = 0. Dari sini dapat ditarik kesimpulan bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun.
<br>

## Penjelasan Soal No 3
Tabel :
<br>
![image](https://user-images.githubusercontent.com/89970736/170874957-70e70fc1-4682-4c1e-a522-9e2f515a60a8.png)
<br>
Hitunglah :
## ==> A
H0 dan H1
<br>
H0 dan H1 dilakukan perhitungan H0 sebagai berikut
<br>
![image](https://user-images.githubusercontent.com/89970736/170875061-8ebd36c3-1b39-460e-bd4e-d8374ec14a58.png)
<br>
dilakukan perhitungan H1 sebagai berikut
<br>
![image](https://user-images.githubusercontent.com/89970736/170875102-1d8e53e6-f85f-46af-8975-de03682d90dc.png)
<br>

## ==> B
Hitung Sampel Statistik
<br>
Dilakukan perhitungan sampel statistik sebagai berikut
```c
tsum.test(mean.x = 3.64, s.x = 1.67, n.x = 19, mean.y = 2.79 , s.y = 1.32,
          n.y = 27, alternative = "greater", var.equal = TRUE)
```
Didapatkan hasil sebagai berikut
<br>
![image](https://user-images.githubusercontent.com/89970736/170875487-d362f274-89b6-4d88-a550-daa258d5f024.png)
<br>

## ==> C
Lakukan Uji Statistik (df =2)
<br>
Lakukan install library `mosaic` sebagai berikut
```c
install.packages("mosaic")
library(mosaic)
  
plotDist(dist='t', df=2, col="blue")
```
Didapatkan hasil uji statistik sebagai berikut
<br>
![image](https://user-images.githubusercontent.com/89970736/170875651-50505f21-a6a9-45f0-8608-eec8f8c16b20.png)
<br>

## ==> D
Nilai Kritikal
<br>
Adapun cara untuk mendapatkan nilai kritikal bisa menggunakan `qchisq` dengan `df=2` sesuai soal sebelumnya sebagai berikut
```c
qchisq(p = 0.05, df = 2, lower.tail=FALSE)
```
Adapun hasil yang didapatkan sebagai berikut
<br>
![image](https://user-images.githubusercontent.com/89970736/170875841-2a075b99-f8eb-4fd2-a0e9-2c5a4d9b64b0.png)
<br>

## ==> E
Keputusan
<br>
Teori keputusan adalah teori formal pengambilan keputusan di bawah ketidakpastian. Aksinya adalah :`({a}_{a∈A})` Kemungkinan konsekuensi : `({c}_{c∈C})`
(tergantung pada keadaan dan tindakan) Maka keputusan dapat dibuat dengan `t.test`
<br>

## ==> F 
Kesimpulan
<br>
Tidak terdapat perbedaan rata-rata jika ditinjau dari uji statistik, namun akan ada (tidak signifikan) jika dipengaruhi nilai kritikal.
<br>

## Penjelasan Soal No 4
## ==> A
Buatlah masing masing jenis spesies menjadi 3 subjek "Grup" (grup 1,grup 2,grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.
<br>
Langkah pertama mengambil data dari link yang telah disediadakan, selanjutnya buat `setFile` menjadi group, dicek apakah dia menyimpan nilai groupnya.
Diakhir bagi tiap valuer menjadi 3 bagian ke 3 grup. Untuk algoritmanya dapat dilihat sebagai berikut
```c
setFile  <- read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt"))
dim(setFile)
head(setFile)
attach(setFile)
  
setFile$V1 <- as.factor(setFile$V1)
setFile$V1 = factor(setFile$V1,labels = c("Kucing Oren","Kucing Hitam","Kucing Putih","Kucing Oren"))
  
class(setFile$V1)
  
group1 <- subset(setFile, V1=="Kucing Oren")
group2 <- subset(setFile, V1=="Kucing Hitam")
group3 <- subset(setFile, V1=="Kucing Putih")
```

## ==> B
Carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil ?
<br>
Homogeneity of variances dapat dicari dengan menggunakan command sebagai berikut
```c
bartlett.test(Length~V1, data=dataoneway)
```
Setelah di jalankan maka nilai p-value = 0.8054. Sehingga dapat disimpulkan bahwa Bartlett's K-squared memiliki nilai sebesar 0.43292 dan df bernilai 2

## ==> C
Untuk uji ANOVA (satu arah), buatlah model linier dengan Panjang versus Grup dan beri nama model tersebut model 1.
<br>
Untuk algoritma modelnya dapat dilihat sebagai berikut
```c
qqnorm(group1$Length)
qqline(group1$Length)
```
Untuk tampilan gambar modelnya dapat dilihat sebagai berikut
<br>
![image](https://user-images.githubusercontent.com/89970736/170877162-2e4075c1-ca48-4892-a0fa-754c429b3ee9.png)
<br>

## ==> D
Dari Hasil Poin C, Berapakah nilai-p ? , Apa yang dapat Anda simpulkan dari H0?
<br>
Setelah di jalankan maka nilai p-value = 0.8054

## ==> E
Verifikasilah jawaban model 1 dengan Post-hoc test Tukey HSD, dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? 3 Jelaskan.
<br>
Pertama-tama gunakanlah command ANOVA, kemudian menggunakan command `anova(model1)`, dan terakhir gunakanlah model Post-hoc Tukey HSD sebagai berikut.
```c
model1 <- lm(Length~Group, data=setFile)
  
anova(model1)
  
TukeyHSD(aov(model1))
```

## ==> F
Visualisasikan data dengan ggplot2
<br>
Algoritma visualisasi data dapat dilihat sebagai berikut
```c
library(ggplot2)
ggplot(dataoneway, aes(x = Group, y = Length)) + geom_boxplot(fill = "grey80", 
       colour = "black") + scale_x_discrete() + xlab("Treatment Group") +  
       ylab("Length (cm)")
```

## Penjelasan Soal No 5
## ==> A
Buatlah plot sederhana untuk visualisasi data
<br>
Jalankan semua library yang diperlukan, kemudian baca file GTL.csv dari documents sebagai berikut
```c
install.packages("multcompView")
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)
  
GTL <- read_csv("GTL.csv")
head(GTL)
```
Didapatkan hasil sebagai berikut
<br>
![image](https://user-images.githubusercontent.com/89970736/170877825-af6f4ec3-fac3-4ecd-a70c-b6931047e1f5.png)
<br>
Kemudian lakukan observasi pada data menggunakan `str(GTL)` dan didapatkan hasil sebagai berikut.
<br>
![image](https://user-images.githubusercontent.com/89970736/170878093-2075afa5-6bb7-4a5d-9d17-585421854df5.png)
<br>
Selanjutnya lakukan viasualisasi menggunakan simple plot sebagai berikut
```c
qplot(x = Temp, y = Light, geom = "point", data = GTL) +
    facet_grid(.~Glass, labeller = label_both)
```
Dan didapatkan tampilan sebagai berikut
<br>
![image](https://user-images.githubusercontent.com/89970736/170877992-68dda0fc-3cd4-41c7-8723-ea9d7298a67e.png)
<br>

## ==> B
Lakukan uji ANOVA dua arah
<br>
Di awal kita akan membuat variabel as factor sebagai ANOVA sebagai berikut
```c
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)
```
Untuk hasil runningnya adalah sebagai berikut
<br>
![image](https://user-images.githubusercontent.com/89970736/170878387-f75143b7-a41c-4f81-b427-b6e90f45951c.png)
<br>
Kemudian lakukan Analisis of Variance (AOV) sebagai berikut
```c
anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)
```
Didapatkan hasil analisis sebagai berikut
<br>
![image](https://user-images.githubusercontent.com/89970736/170878541-cb0f46a2-c1a7-424d-9d4a-a9d70967b09b.png)
<br>

## ==> C
Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)
<br>
Untuk menampilkan tabel mean dan standar deviasi keluaran cahaya untuk setiap perlakuan, dapat digunakan `group_by()` diikuti dengan `summarise()` sebagai
berikut.
```c
data_summary <- group_by(GTL, Glass, Temp) %>%
   summarise(mean=mean(Light), sd=sd(Light)) %>%
   arrange(desc(mean))
print(data_summary)
```
Didapatkan tampilan tabelnya sebagai berikut
<br>
![image](https://user-images.githubusercontent.com/89970736/170878858-fbf815c7-27df-4499-92cc-c33b04249724.png)
<br>

## ==> D
Lakukan uji Tukey
<br>
Lakukan uji Tukey dengan engan menggunakan `TukeyHSD` sebagai berikut
```c
tukey <- TukeyHSD(anova)
print(tukey)
```
Didapatkan hasil uji Tukey sebagai berikut
<br>
![image](https://user-images.githubusercontent.com/89970736/170879072-b6e51b51-ac84-4533-b36d-511757c71f8b.png)
<br>
![image](https://user-images.githubusercontent.com/89970736/170879144-d5ad1023-3515-46bf-a0cd-128a20dc9d3d.png)
<br>

## ==> E
Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey
<br>
Pertama-tama buatlah compact letter display sebagai berikut
```c
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)
```
Adapun displaynya sebagai berikut
<br>
![image](https://user-images.githubusercontent.com/89970736/170879420-d80d5bdc-8939-4034-924e-895eadde9cef.png)
<br>
Tambahkan compact letter display tersebut ke tabel dengan mean dan sd sebagai berikut
```c
cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
print(data_summary)
```
Adapun hasil yang didapatkan adalah sebagai berikut
<br>
![image](https://user-images.githubusercontent.com/89970736/170879624-c13a8344-7980-442e-9844-27d6d1066c1d.png)
