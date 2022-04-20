% Bu veri seti saatte 4.5km/h yani saniyede 1.25 metre yol alacak
%bir insan için oluşturulacak.
%Sensörümüzün saniyede 10 kere ölçüm alacağını düşüneceğiz. Ve her veri
%seti 10 saniyeden oluşacak.
%4*4 lük alanı 4 metre bir yere kurduğumuzu düşünürsek 4 metreyi bir
%insanın uçtan uca geçmesi 3.2 saniye sürer. Bu da 32 döngü demek.
%Her "zone" un bir metre olduğunu düşünürsek bir insan bir zone 800ms 
%de geçecek. Bu da 8 döngü demek. Haliyle insan 8 döngü boyunca bir zoneda
%var gözükecek. Sonraki 8 döngü boyunca başka bir zonde gözükecek. Başka
%bir 8 döngü sonunda başka bir zone da görülecek
%(sensörün çarpraz
%yerleştirilip zone ların gittikçe küçüleceği hesaba katılmamıştır.)

%haliyle adamın yönüne doğru bakılırken 1 döngü öncesine değil 8 döngü
%öncesine yani 8 matris öncesine bakmak daha mantıklı olacaktır.

%Bu hesaplama parametrelerle de yapılabilir.




A=zeros(4);


for index=1:100
    
    A(:,:,index)=zeros(4);
end
kapiya_paralel_yuruyen=A;
kapiya_dogru_yuruyen=A;
ortada_duran=A;
carpraz_gecen=A;

for k=1:32
    kapiya_paralel_yuruyen(1,ceil(k/8),k)=1;
end

for k=1:32
    kapiya_dogru_yuruyen(ceil(k/8),2,k)=1;
end

for k=1:16
    carpraz_gecen(ceil(k/8),1,k)=1;
end

for k=16:32
    carpraz_gecen(ceil(k/8),2,k)=1;
end
