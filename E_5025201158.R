# Soal 1

# 1.a
# Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas

# Data kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas
  sebelum <- c(78, 75, 67, 77, 70, 72, 28, 74, 77)
  sesudah <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)

# Pengecekan data
  data <- data.frame(
          group = rep(c("oksigen.sebelum", "oksigen.sesudah"), each = 9),
          saturation = c(sebelum, sesudah)
       )
  
# Mencetak data
  print(data)
  
# Standar Devisiasi sebelum dan sesudah aktivitas
  sd_sebelum <- sd(sebelum)
  sd_sebelum
  
  sd_sesudah <- sd(sesudah)
  sd_sesudah
  
# 1.b
# Carilah nilai t (p-value)
  
# Mencari nilai t(p-value) dengan t-test
  t.test(sebelum, sesudah, alternative = "greater", var.equal = FALSE)
  
# 1.c
# Tentukanlah apakah terdapat pengaruh yang signifikan secara statistika
# dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan
# aktivitas A jika diketahui tingkat signifikansi ???? = 5% serta H0 : "tidak ada
# pengaruh yang signifikan secara statistika dalam hal kadar saturasi
# oksigen , sebelum dan sesudah melakukan aktivitas A"
  
  var.test(sebelum, sesudah)
  
  t.test(sebelum, sesudah, mu = 0, alternative = "two.sided", var.equal = TRUE)
  
# Soal 2
  
  install.packages("BSDA")
  library(BSDA)
  
# 2.a
# Apakah Anda setuju dengan klaim tersebut?
# Setuju
  
# 2.b
# Jelaskan maksud dari output yang dihasilkan!
  tsum.test(mean.x = 23500, sd(3900), n.x = 100)
  
# 2.c
# Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!
# Setelah dilakukan perhitungan, didapatkan bahwa z = 8.97, dan P-value = 0.
# Dari sini dapat ditarik kesimpulan bahwa mobil dikemudikan rata-rata lebih 
# dari 20.000 kilometer per tahun.
  
# Soal 3
  
# 3.a
# H0 dan H1
# Jawaban di Readme
  
# 3.b
# Hitung Sampel Statistik
  tsum.test(mean.x = 3.64, s.x = 1.67, n.x = 19, mean.y = 2.79 , s.y = 1.32,
            n.y = 27, alternative = "greater", var.equal = TRUE)
  
# 3.c
# Lakukan Uji Statistik (df =2)
  install.packages("mosaic")
  library(mosaic)
  
  plotDist(dist='t', df=2, col="blue")
  
# 3.d
# Nilai Kritikal
  qchisq(p = 0.05, df = 2, lower.tail=FALSE)
  
# 3.e
# Keputusan
# Jawaban di Readme

# 3.f
# Kesimpulan
# Jawaban di Readme
  
# Soal 4
  
# 4.a
# Buatlah masing masing jenis spesies menjadi 3 subjek "Grup" (grup 1,grup
# 2,grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan
# lihat apakah ada outlier utama dalam homogenitas varians.
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
  
# 4.b
# Carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang
# didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil ?
  bartlett.test(Length~V1, data=dataoneway)
  
# 4.c
# Untuk uji ANOVA (satu arah), buatlah model linier dengan Panjang versus
# Grup dan beri nama model tersebut model 1.
  qqnorm(group1$Length)
  qqline(group1$Length)
  
# 4.d
# Dari Hasil Poin C, Berapakah nilai-p ? , Apa yang dapat Anda simpulkan
# dari H0?
# Jawaban di Readme
  
# 4.e
# Verifikasilah jawaban model 1 dengan Post-hoc test Tukey HSD, dari nilai p
# yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? Jelaskan
  model1 <- lm(Length~Group, data=setFile)
  
  anova(model1)
  
  TukeyHSD(aov(model1))
  
# 4.f
# Visualisasikan data dengan ggplot2
  library(ggplot2)
  ggplot(dataoneway, aes(x = Group, y = Length)) + geom_boxplot(fill = "grey80", 
         colour = "black") + scale_x_discrete() + xlab("Treatment Group") +  
         ylab("Length (cm)")
  
# Soal 5

# 5.a
# Buatlah plot sederhana untuk visualisasi data
  install.packages("multcompView")
  library(readr)
  library(ggplot2)
  library(multcompView)
  library(dplyr)
  
  GTL <- read_csv("GTL.csv")
  head(GTL)
  
  str(GTL)
  
  qplot(x = Temp, y = Light, geom = "point", data = GTL) +
    facet_grid(.~Glass, labeller = label_both)
  
# 5.b
# Lakukan uji ANOVA dua arah
  GTL$Glass <- as.factor(GTL$Glass)
  GTL$Temp_Factor <- as.factor(GTL$Temp)
  str(GTL)
  
  anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
  summary(anova)
  
# 5.c
# Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk
# setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)
  data_summary <- group_by(GTL, Glass, Temp) %>%
    summarise(mean=mean(Light), sd=sd(Light)) %>%
    arrange(desc(mean))
  print(data_summary)
  
# 5.d
# Lakukan uji Tukey
  tukey <- TukeyHSD(anova)
  print(tukey)
  
# 5.e
# Gunakan compact letter display untuk menunjukkan perbedaan signifikan
# antara uji Anova dan uji Tukey
  tukey.cld <- multcompLetters4(anova, tukey)
  print(tukey.cld)
  
  cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
  data_summary$Tukey <- cld$Letters
  print(data_summary)
  
  write.csv("GTL_summary.csv")