---
name: direction
description: >-
  Direção de arte INICIAL e interativa — use ANTES de construir qualquer site,
  antes das skills de execução (/section-hero, /gsap-component, /palette,
  /perf-audit, /responsive-fix). Funciona como um diretor de arte fazendo o
  briefing: conduz o usuário por decisões-chave (referência/vibe, pareamento de
  fontes, número e tipo de seções, mood de paleta, intensidade de movimento) uma
  de cada vez, com opções curadas, e no fim gera um DIRECTION.md que orienta toda
  a construção. Objetivo: tirar a página da "cara de template" antes da primeira
  linha de código.
metadata:
  type: reference
  visibility: private
---

# Direction — o briefing antes do site

> Um site genérico nasce genérico porque ninguém **dirigiu** antes de codar.
> Esta skill é o diretor de arte: ela decide o rumo ANTES da execução.
> Não escreve o site — ela define o gosto que as outras skills vão executar.

**Posição no fluxo:**
```
/direction  ←  VOCÊ ESTÁ AQUI (define o rumo)
   ↓
/palette · /section-hero · /gsap-component   (executam)
   ↓
/perf-audit · /responsive-fix                (refinam)
```

## Como conduzir (interativo — uma pergunta por vez)

Faça **uma decisão de cada vez**, oferecendo opções curadas. Nunca despeje tudo
junto. Após cada resposta, confirme e avance. Ao final, gere o `DIRECTION.md`.

### Passo 1 — Referência & vibe
Pergunte qual o sentimento-âncora. Ofereça direções (não deixe em aberto):
- **Editorial silencioso** — off-white, serifa, muito respiro, pouco movimento.
- **Luxo escuro** — preto profundo, grain, light leaks, movimento contido.
- **Terroso/orgânico** — bege, texturas, tons quentes.
- **Brutalista refinado** — alto contraste, tipografia gigante, grids assimétricos.

> A cor é livre. A única proibição absoluta: degradê roxo/azul saturado de SaaS.

### Passo 2 — Pareamento de fontes
Ofereça 2–3 pares curados pra escolher (display + corpo, evitando Poppins/Inter/Montserrat):
- **Editorial:** Instrument Serif (títulos) + Satoshi (corpo).
- **Forte/moderno:** Clash Display (títulos) + Satoshi (corpo).
- **Misto luxo:** Clash Display (hero) + Instrument Serif (citações) + Satoshi (corpo).

Regra a fixar: títulos com tracking NEGATIVO (`-0.04em` a `-0.06em`); labels
pequenos com tracking POSITIVO (`0.04em`+) — "segredo do luxo".

### Passo 3 — Arquitetura de seções
Pergunte o objetivo do site, então proponha um esqueleto enxuto (5–7 seções).
Esqueleto-base recomendado:
1. **Hero cinematográfica** (→ delega pra `/section-hero`)
2. **Manifesto/citação** (texto grande, reveal por linha)
3. **Galeria/coleção** (carrossel ou grid editorial)
4. **Experiência** (capítulos com scroll travado)
5. **FAQ** ou prova
6. **CTA/seleção privada**
7. **Footer monumental** (marca gigante)

Decida com o usuário o que **cortar** — menos seções, mais foco. Contenção é luxo.

### Passo 4 — Mood de paleta
Defina base + contraste + 1 acento dessaturado. Quando definido, **delegue a
geração das variações pra `/palette`** (ela mapeia e gera 3 opções).
Fixe o grade unificado das mídias:
`sepia(0.18) saturate(0.82) contrast(1.06) brightness(0.97)`.

### Passo 5 — Intensidade de movimento
Pergunte o nível (define quanto trabalho vai pra `/gsap-component`):
- **Sutil** — fades + parallax leve.
- **Cinematográfico** (padrão) — scroll travado, reveals por linha, parallax em camadas.
- **Imersivo** — vídeo/canvas no hero, sequência de frames, cursor custom.

Tokens a fixar: easing `cubic-bezier(0.22, 1, 0.36, 1)`, reveals 0.6–1.2s,
stagger ~0.08s, smooth scroll ~1.5. Sempre respeitar `prefers-reduced-motion`.

### Passo 6 — Texturas de filme
Confirme o pacote: grain (`0.03` overlay / `0.08` soft-light), vinheta, light
leak pulsando, cursor `mix-blend-mode: difference`. Liga/desliga conforme a vibe.

---

## Saída — gere `DIRECTION.md`

Ao final, escreva um documento curto que as outras skills consomem:

```markdown
# DIRECTION — <nome do projeto>
Vibe: <...>           |  Proibido: degradê roxo/azul SaaS
Fontes: <display> + <corpo>   (tracking títulos -0.05em / labels +0.06em)
Seções: <lista final enxuta>
Paleta: base <..> / contraste <..> / acento dessaturado <..>   → rodar /palette
Grade mídias: sepia(0.18) saturate(0.82) contrast(1.06) brightness(0.97)
Movimento: <nível>   ease cubic-bezier(0.22,1,0.36,1) · reveal 0.6–1.2s · stagger 0.08s
Texturas: grain ✓ · vinheta ✓ · light leak ✓ · cursor custom ✓
Próximos passos: /section-hero → /gsap-component → /perf-audit → /responsive-fix
```

## Regra de ouro
Cada decisão deve parecer **dirigida, não montada**. Se o usuário hesitar,
recomende a opção mais contida — *menos é mais*. Saída desta skill = um rumo
claro que impede o site de nascer genérico.
