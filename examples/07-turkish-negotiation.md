# Example 7: Language Mode -- Turkish Negotiation Preparation

## Scenario

Emre is the founder of LogiVer, an Istanbul-based logistics SaaS that optimises last-mile delivery for Turkish e-commerce companies. He has a partnership meeting with a large Turkish enterprise client -- a national retail chain that could become his biggest account. Emre studied at Bogazici University, speaks fluent English, but prefers working in Turkish. His strategic thinking is sharper in his native language. His message to Foreman: "Buyuk bir kurumsal musteri ile ortaklik toplantim var. Hazirliklari Turkce yapmak istiyorum."

**Mode activated:** `/language turkish`

**Purpose of this example:** Demonstrate how Language Mode transforms all system outputs into the target language while keeping commands, skill file names, and internal processing in English. Show framework name handling (first mention bilingual, subsequent mentions natural Turkish), Foreman voice translation, and how the analytical register adapts to Turkish business conventions.

---

## Conversation

### Turn 1: Emre's Opening

**Emre:**
> /language turkish

**Behind the scenes:**
```
Command processor receives /language turkish.
  Language code resolved: "turkish" → "tr"
  Memory update: identity.language = "tr", identity.language_set_date = "2026-03-26"
  Language mode active. All outputs in Turkish.
  Register: formal (siz). Business Turkish conventions.
  Commands remain in English. Skill file names remain in English.
```

**Foreman:**
> Dil modu etkinlestirildi: Turkce. Bundan sonra tum sistem ciktilari Turkce olarak sunulacaktir. Komut sozdizimi (/apply, /diagnose, /run) Ingilizce kalacaktir.

**Emre:**
> Buyuk bir kurumsal musteri ile ortaklik toplantim var. Hazirliklari Turkce yapmak istiyorum. Ulusal bir perakende zinciri -- son mil lojistik optimizasyonumuzu kullanmak istiyorlar ama kosullari tartismamiz gerekiyor.

**Behind the scenes:**
```
Orchestrator receives input in Turkish.
Internal processing remains in English:
  Intent: "Partnership meeting with large enterprise client, needs preparation"

Phase 2 — Hook Matching (English):
  negotiation-hook triggered
    Pattern match: "partnership meeting" + "discuss terms"

Phase 3 — Diagnostic:
  negotiation-stuck-diagnosis → not triggered (not stuck yet; preparing)
  Direct playbook routing appropriate

Phase 4 — Playbook:
  negotiation-playbook selected
    Steps: negotiation-mindset-and-self → game-theory-fundamentals →
           information-asymmetry → cooperative-negotiation →
           competitive-negotiation → delivering-the-deal
    Selected subset for this session:
      Step 1: negotiation-mindset-and-self
      Step 3: information-asymmetry
    Final output: negotiation-prep-sheet

Phase 5 — Output Language:
  All step outputs rendered in Turkish
  Framework names: first mention English+Turkish, subsequent natural Turkish
  Foreman voice: analytical, institutional → Turkish formal register (siz)
```

**Foreman:**
> Ulusal capte bir perakende zinciri ile ortaklik muzakeresine hazirlaniyorsunuz. Bu, LogiVer icin donusum noktasi olabilecek bir gorusme.
>
> Uc soru:
> 1. **Gorusme ne zaman?** Hazirlik icin kac gun var?
> 2. **Karsi tarafin karar vericisi kim?**
> 3. **Daha once bu sirket ile herhangi bir temasiniz oldu mu?**

---

### Turn 2: Emre Provides Context

**Emre:**
> Gorusme gelecek hafta Persembe. Karsi tarafta tedarik zinciri direktoru ve IT direktoru olacak. Onceden bir pilot calisma yaptik -- 3 aylik, basarili gecti. Simdi tam entegrasyon sartlarini konusacagiz.

**Behind the scenes:**
```
Context processed (English internal):
  Meeting: next Thursday (~8 days)
  Counterparts: Supply chain director + IT director
  History: successful 3-month pilot → full integration negotiation
  Negotiation type: expansion from pilot to enterprise contract

Playbook Runner activates negotiation-playbook Step 1:
  Skill: negotiation-mindset-and-self
  Output language: Turkish
  Framework name handling: first mention bilingual
```

**Foreman:**
> Uc aylik basarili pilot, guclu bir pozisyon. Karsi taraf sizin degerinizi zaten test etti ve devam etme karari verdi -- bu, muzakere gucunuzu onemli olcude artiriyor. Asil risk, bu gucu fark etmemek ve gereksiz tavizler vermektir.
>
> ### Adim 1: Muzakere Zihniyeti ve Benlik Hazirlig (Negotiation Mindset and Self)
>
> Bu cerceve, muzakereye girmeden once ic hazirliginizi yapilandirir: kisisel egilimlerinizi tanimayi, duygusal tetikleyicilerinizi belirlemeyi ve bilincsiz varsayimlarinizi denetlemeyi iceriyor.
>
> **Kisisel Muzakere Profili:**
>
> Asagidaki sorulari yanitlayin. Amaciniz kendinizi degerlendirmek degil -- muzakere masasinda otomatik olarak devreye girecek egilimleri onceden teshis etmektir.
>
> | Alan | Soru | Neden Onemli |
> |------|------|-------------|
> | **Varsayilan stil** | Isbirligi mi yoksa rekabet mi tercih edersiniz? | Kurumsal muzakerelerde asiri isbirligi, taviz verme refleksine donusebilir. |
> | **Taviz esligi** | Gecmis muzakerelerde, karsi taraf taviz verdikten sonra mi yoksa vermeden once mi taviz verdiniz? | Onceden taviz vermek, guc dengesini karsi tarafa kaydirabilir. |
> | **Sessizlik toleransi** | Karsi taraf sustugunda rahatsiz olur musunuz? | Kurumsal alisverisler tarzinda suskunluk, baskı aracı olarak kullanilir. Sessizlige dayaniklilik, muzakerede somut avantajdir. |
> | **Baglayici sozcukler** | "Sadece," "aslinda," "belki" gibi yumusatici ifadeler kullaniyor musunuz? | Bu sozcukler pozisyonunuzun gucunu azaltir. |
> | **Referans noktasi** | Fiyatlandirmada kendi maliyet yapisindan mi yoksa karsi tarafin elde ettigi degerden mi yola cikiyorsunuz? | Maliyet-arti fiyatlandirma, deger-bazli fiyatlandirmadan neredeyse her zaman daha dusuk sonuc uretir. |
>
> **Duygusal Tetikleyici Haritasi:**
>
> Her muzakerecinin otomatik tepki urettigi senaryolari vardir. Pilotunuz basarili gecti -- dolayisiyla en olasi tetikleyiciler sunlardir:
>
> - **"Pilot basarili ama fiyatiniz cok yuksek."** Hazirlik: deger-bazli arguman, maliyet degil.
> - **"Baska cozumleri de degerlendiriyoruz."** Hazirlik: Bu, standart kurumsal muzakere taktigidir. Gercek bir alternatif olup olmadigini sorgulayacak sorular hazirlayin.
> - **"IT entegrasyonu icin ozel kosullar istiyoruz."** Hazirlik: esneklik sinirinizi onceden belirleyin. Neye evet, neye hayir diyeceginizi masaya oturmadan once kararlastirin.

---

### Turn 3: Information Asymmetry Analysis

**Behind the scenes:**
```
Playbook Runner activates Step 3:
  Skill: information-asymmetry
  Output language: Turkish
  Framework name handling:
    First mention: "Bilgi Asimetrisi (Information Asymmetry)"
    Subsequent: "bilgi asimetrisi" (natural Turkish)
```

**Foreman:**
> ### Adim 3: Bilgi Asimetrisi (Information Asymmetry) Analizi
>
> Her muzakerenin gorulmeyen boyutu, taraflarin birbirinin bilmediklerini bilmemesidir. Bilgi asimetrisi analizi, hangi bilgilerin kimde oldugunu haritalandirir ve bu haritayi stratejik avantaja cevirir.
>
> **Bilgi Haritasi: LogiVer vs. Perakende Zinciri**
>
> | Bilgi Alani | Siz Biliyorsunuz | Onlar Biliyorlar | Asimetri Yonu |
> |------------|-----------------|------------------|---------------|
> | **Pilot sonuclari** | Tum teknik performans verileri, maliyet tasarrufu hesaplari, entegrasyon suresi | Kendi ic KPI'larina gore pilot degerlendirmesi -- sizinle paylasip paylasmadiklari ayri bir soru | Esit degil -- siz kendi verilerinizi biliyorsunuz ama onlarin ic degerlendirmesini bilmiyorsunuz |
> | **Alternatif cozumler** | Rakiplerinizin guclu ve zayif yonleri | Gercekten baska cozumleri test edip etmedikleri | Onlarin lehine -- "baska secenek degerlendiriyoruz" gercek mi blof mu bilemezsiniz |
> | **Butce kisitlari** | Bilinmiyor | Ic butce limitleri ve onay surecleri | Onlarin lehine -- butcelerini bilmiyorsunuz |
> | **Stratejik oncelik** | Bilinmiyor | Lojistik optimizasyonunun sirket stratejisindeki onceligi | Onlarin lehine -- bu bilgi fiyat esnekligini belirler |
> | **Teknik maliyet** | Tam entegrasyon maliyetiniz ve kar marjiniz | Bilinmiyor | Sizin lehinize -- maliyet yapinizi aciklamak zorunda degilsiniz |
> | **Olceklenme kapasitesi** | Sisteminizin hangi hacme kadar olceklendigi | Bilinmiyor | Sizin lehinize -- gelecekteki buyume degerini siz biliyorsunuz |
>
> **Bilgi Asimetrisi Stratejisi:**
>
> Muzakere oncesinde uc kritik bilgi acigini kapatmaniz gerekiyor:
>
> 1. **Onlarin ic pilot degerlendirmesi.** Soru: "Pilot sonuclarini ic ekiplerinizle nasil degerlendirdiniz? Hangi metrikler beklentilerinizi karsiladi, hangileri karsilamadi?" Bu soruyu muzakerenin basinda, dostane bir tonla sorun. Aldığıniz yanit, fiyat muzakeresinin tum seyrini belirleyecektir.
>
> 2. **Gercek alternatif durumu.** Soru: "Tam entegrasyon icin baska cozumleri de aktif olarak degerlendiriyor musunuz, yoksa pilot sonuclarina dayanarak bizimle ilerleme karari mi verdiniz?" Dogrudan sorun. Cekingenlik, bilgi asimetrisini karsi tarafin lehine korur.
>
> 3. **Butce ve onay sureci.** Soru: "Bu olcekte bir entegrasyon karari icin ic onay sureci nasil isliyor? Kimler dahil, hangi esiklerde ust yonetim onayi gerekiyor?" Bu soru, muzakere zaman cizelgesini ve karar dinamiklerini aciga cikarir.
>
> **Aciklamama Stratejisi:**
>
> Iki bilgiyi muzakerede aciklamayin:
> - **Tam maliyet yapiniz.** Deger-bazli fiyatlandirma yapiyorsaniz, maliyetiniz muzakere konusu degildir. Konusmayi karsi tarafin elde ettigi degere yonlendirin.
> - **Kapasite fazlaniz.** Eger sisteminiz mevcut kullaniminin cok uzerinde olceklenebiliyorsa, bu bilgi karsi tarafin hacim indirimi talebini guclendirir. Olceklendirmeyi gelecekteki deger olarak konumlandirin, mevcut maliyet avantaji olarak degil.

---

### Turn 4: Final Deliverable -- Negotiation Prep Sheet

**Behind the scenes:**
```
Output Agent formats negotiation-prep-sheet:
  Template: negotiation-prep-sheet (audience: self)
  Language: Turkish (all content)
  Section headers: Turkish
  Fill-in labels: Turkish
  Framework references: natural Turkish (subsequent mention rules)
```

**Foreman:**
> ### Muzakere Hazirlik Formu
>
> **Muzakere:** LogiVer - [Perakende Zinciri Adi] Tam Entegrasyon Gorusmesi
>
> **Tarih:** [Persembe, tarih] | **Yer:** [Belirtilecek] | **Hazirlayan:** Emre
>
> ---
>
> **Amac:** Pilot sonrasinda tam entegrasyon anlasmasinin kosullarini belirlemek. Hedef: en az 12 aylik sozlesme, deger-bazli fiyatlandirma, kademeli uygulama takvimi.
>
> ---
>
> #### Muzakere Parametreleri
>
> | Parametre | Hedef | Alt Sinir | Vazgecme Noktasi |
> |-----------|-------|-----------|------------------|
> | **Sozlesme suresi** | 24 ay | 12 ay | 6 aydan kisa kabul edilmez |
> | **Aylik lisans bedeli** | [Deger-bazli hesap] | [Maliyet + %40 marj] | [Maliyet + %20 marj] altinda anlasmaya varilmaz |
> | **Uygulama takvimi** | 8 hafta | 6 hafta (yogun kaynak gerektirir) | 4 haftadan kisa teknik olarak mumkun degil |
> | **SLA kosullari** | %99.5 uptime | %99.0 uptime | %99.0 altinda taahhut verilmez |
> | **Odeme kosullari** | Yillik pesinat | Ceyreklik pesinat | Aylik odeme kabul edilir ama indirim uygulanmaz |
>
> ---
>
> #### BATNA (Muzakere Alternatifiniz)
>
> Eger bu anlasmaya varilamazsa en iyi alternatifiniz nedir?
>
> - **Mevcut musteri tabani:** [Mevcut MRR ve buyume trendi]
> - **Diger firsat hatti:** [Varsa diger kurumsal gorusmeler]
> - **Pilot verileri baska yerde kullanilabilir mi?** Pilot basari hikayesi, baska kurumsal musteriler icin referans deger tasir.
>
> **Kritik:** BATNA'nizi bilin ama karsi tarafa aciklamayin. Guclu bir BATNA, muzakerede taviz baskisina karsi en etkili sigorta dir.
>
> ---
>
> #### Bilgi Asimetrisi Kontrol Listesi
>
> | Ogrenilecek Bilgi | Soru | Gorusmede Ne Zaman |
> |-------------------|------|-------------------|
> | Ic pilot degerlendirmesi | "Pilot sonuclarini nasil degerlendirdiniz?" | Ilk 15 dakika |
> | Alternatif durum | "Baska cozumleri de aktif degerlendiriyor musunuz?" | Pilot degerlendirmesi sonrasi |
> | Butce ve onay sureci | "Ic onay sureci nasil isliyor?" | Kosullar gundeme geldiginde |
> | Stratejik oncelik | "Lojistik optimizasyonu sirket stratejinizde nerede konumlaniyor?" | Deger tartismasi sirasinda |
>
> | Aciklanmayacak Bilgi | Neden |
> |---------------------|-------|
> | Tam maliyet yapisi | Deger-bazli fiyatlandirmayi korumak icin |
> | Kapasite fazlasi | Hacim indirimi talebini onlemek icin |
>
> ---
>
> #### Muzakere Gunu Kontrol Listesi
>
> - [ ] Pilot sonuclarini tek sayfalik ozet olarak hazirlayın (karsi tarafin ic sunumunda kullanabilecegi formatta)
> - [ ] Fiyat teklifinizi deger-bazli cerceveleyin: "Bu cozum size aylik [X] TL tasarruf sagliyor, bunun icin aylik [Y] TL yatirim yapiyorsunuz"
> - [ ] Ilk teklifi karsi tarafin yapmasi icin alan birakin -- onlarin referans noktasini gorun
> - [ ] Her taviz icin karsılıklı talep hazirlayin (sozlesme suresi uzarsa fiyat esnekligi gibi)
> - [ ] Sessizlige hazirlikli olun -- teklif yaptiktan sonra konusmayin, karsi tarafin yanit vermesini bekleyin

---

## Behind the Scenes: What Language Mode Changed

### Framework Name Handling

| Framework | First Mention | Subsequent Mentions |
|-----------|---------------|---------------------|
| Negotiation Mindset and Self | "Muzakere Zihniyeti ve Benlik Hazirlig (Negotiation Mindset and Self)" | "muzakere zihniyeti" |
| Information Asymmetry | "Bilgi Asimetrisi (Information Asymmetry)" | "bilgi asimetrisi" |
| BATNA | "BATNA (Muzakere Alternatifiniz)" | "BATNA" (acronym preserved, as it is widely used in Turkish business) |

### Voice Translation

The Foreman voice -- analytical, institutional, sophisticated with dry precision -- translates to Turkish as:

| English Foreman Voice | Turkish Foreman Voice |
|----------------------|----------------------|
| "The risk is not the negotiation itself but entering it without preparation." | "Risk, muzakerenin kendisi degil -- hazirliksiz masaya oturmaktir." |
| "Consider whether..." | "Su hususu degerlendirin..." |
| "This is a structural constraint, not a character flaw." | "Bu, yapisal bir kisittir -- kisisel bir eksiklik degil." |

The Turkish output maintains the formal register (siz form), uses established Turkish business terminology, and follows Turkish sentence structure rather than imposing English word order. Business terms with widely accepted Turkish equivalents use those equivalents; terms without established local forms (like "BATNA" or "SLA") remain in their original form.

### Language Boundary

**Stayed in English:** Command syntax (`/language turkish`, `/apply`), skill file names (`negotiation-mindset-and-self`, `information-asymmetry`), template identifiers, internal routing logic.

**Switched to Turkish:** All explanatory text, diagnostic questions, template section headers and labels, table content, system messages.

---

## Final Deliverables

1. **Muzakere Zihniyeti Degerlendirmesi** -- Personal negotiation profile and emotional trigger map, entirely in Turkish
2. **Bilgi Asimetrisi Haritasi** -- Information advantage/gap analysis with strategic questions, in Turkish
3. **Muzakere Hazirlik Formu** -- Complete negotiation prep sheet with parameters, BATNA, and checklists, in Turkish

---

## Key Takeaways

1. **Language mode is total output transformation, not keyword translation.** Every word Emre sees is Turkish. The diagnostic questions are phrased as a Turkish business consultant would phrase them, not as translations of English questions. "Karsi tarafin karar vericisi kim?" is natural Turkish; "Karar verme yetkisine sahip kisi kimdir?" would be a stiff translation.

2. **Framework names follow a clear protocol.** First mention includes the English name in parentheses for precision: "Bilgi Asimetrisi (Information Asymmetry)." Subsequent mentions use the natural Turkish form. Acronyms like BATNA and SLA remain in English because they are internationally established and widely used in Turkish business contexts.

3. **Commands stay English; outputs switch.** Emre types `/language turkish` -- the slash command is English. The confirmation message is Turkish. This separation is clean and consistent: the system's interface language (commands) and its communication language (outputs) are independent.

4. **The analytical voice survives translation.** Foreman's institutional precision -- the short declarative sentences, the structured analysis, the absence of filler -- translates into Turkish business register without losing its character. The formal "siz" form maintains professional distance. The sentence rhythm adapts to Turkish syntax rather than mirroring English structure.

5. **Internal processing remains English.** The orchestrator matched hooks, selected skills, and routed playbooks in English. Only the output-agent performed the language transformation. This ensures that routing logic, skill selection, and diagnostic accuracy are not affected by the language switch.
