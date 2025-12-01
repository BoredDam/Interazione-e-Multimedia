### MSE (Mean Squared Error)

L’MSE misura l’errore medio quadratico tra due immagini $I_1$ e $I_2$:

$$
\text{MSE} = \frac{1}{N} \sum_{x,y} \left( I_1(x,y) - I_2(x,y) \right)^2
$$

- $N$: numero totale di pixel  
- $I_1(x,y)$, $I_2(x,y)$: valore del pixel in posizione $(x,y)$ nelle due immagini  
- Più l’MSE è **vicino a 0**, più le immagini sono **simili**.

---

### PSNR (Peak Signal-to-Noise Ratio)

Il PSNR valuta la qualità di un’immagine rispetto all’originale:

$$
\text{PSNR} = 10 \log_{10} \left( \frac{\text{MAX}_I^2}{\text{MSE}} \right)
$$

- $\text{MAX}_I$: valore massimo possibile di un pixel (es. 255 per 8 bit)  
- Più il **PSNR è alto** (in dB), migliore è la **qualità** dell’immagine (meno distorsione).
