SELECT musteriler.musteri_id,musteriler.ad_soyad,musteriler.sehir,musteriler.meslek_grubu,krediler.kredi_turu,krediler.kredi_tutari,taksitler.taksit_tutari,taksitler.gecikme_gun_sayisi,
 CASE 
        WHEN taksitler.gecikme_gun_sayisi = 0 THEN 'Normal'
        WHEN taksitler.gecikme_gun_sayisi <= 30 THEN 'Hafif Gecikme'
        WHEN taksitler.gecikme_gun_sayisi <= 90 THEN 'Yuksek Risk'
        ELSE 'Temerrut / Batik'
    END AS risk_grubu
FROM musteriler 
JOIN krediler  ON musteriler.musteri_id = krediler.musteri_id
JOIN taksitler  ON krediler.kredi_id = taksitler.kredi_id;