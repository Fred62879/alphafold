alias ct='ls | wc -l'
alias killtn='kill -9 $(jobs -p)'
alias remove='find . -mtime +5 -exec rm {} +'

alias venv='source ~/env/astro_env/bin/activate'
alias afvenv='source ~/env/alphafold_env/bin/activate'
alias icpu='salloc --time=0:30:0 --mem=20000M --account=def-kyi-ab'
alias igpu='salloc --time=1:00:0 --gres=gpu:1 --nodes=1 --mem=40000M --account=def-kyi-ab'
alias igput4='salloc --time=1:00:0 --gres=gpu:t4:1 --nodes=1 --mem=40000M --account=def-kyi-ab'
alias igpuv100='salloc --time=1:00:0 --gres=gpu:v100:1 --nodes=1 --mem=40000M --account=def-kyi-ab'

alias afload1='module load gcc/9.3.0 openmpi/4.0.3 cuda/11.2.2 cudnn/8.2.0'
alias afload2='module load kalign/2.03 hmmer/3.2.1 openmm-alphafold/7.5.1 hh-suite/3.3.0'

alias code='cd ~/scratch/fred862/code'
alias s2s='cd ~/scratch/fred862/code/s2s'
alias acorn='cd ~/scratch/fred862/code/acorn'
alias astro='cd ~/scratch/fred862/code/astro'
alias af='cd ~/scratch/fred862/code/alphafold'
alias pnp='cd ~/scratch/fred862/code/pnp/experiments/inpainting'

alias cosmos='cd ~/projects/rrg-kyi/astro/cosmos'
alias spectra='cd ~/projects/rrg-kyi/astro/hsc/spectra'
alias hscpdr3='cd ~/projects/rrg-kyi/astro/hsc/pdr3_dud'
alias public='cd ~/projects/rrg-kyi/astro/hsc/fred_astro'
alias megau='cd ~/projects/rrg-kyi/astro/cosmos/cfht/tilesv5'
alias gblc='gurobi_cl 1> /dev/null && echo Success || echo Fail'
#alias cosmos='emacs ~/projects/rrg-kyi/astro/hsc/tracts_patches_DUD-COSMOS.txt'

alias data='cd ~/scratch/fred862/data/astro'
alias datal='cd ~/projects/def-kyi-ab/fred862/data'

alias pd3in='cd ~/scratch/fred862/data/astro/pdr3_input'
alias pd3out='cd ~/scratch/fred862/data/astro/pdr3_output'

alias 3i2d5='cd ~/scratch/fred862/data/astro/pdr3_input/2d_5'
alias 3i2d10='cd ~/scratch/fred862/data/astro/pdr3_input/2d_10'

alias i5grizy='cd ~/scratch/fred862/data/astro/pdr3_input/5_grizy'
alias i10='cd ~/scratch/fred862/data/astro/pdr3_input/10'

alias 3o2d5='cd ~/scratch/fred862/data/astro/pdr3_output/2d_5'
alias 3o2d10='cd ~/scratch/fred862/data/astro/pdr3_output/2d_10'

alias o1g='cd ~/scratch/fred862/data/astro/pdr3_output/1_g'
alias o5grizy='cd ~/scratch/fred862/data/astro/pdr3_output/5_grizy'
alias o10='cd ~/scratch/fred862/data/astro/pdr3_output/10'

alias mask='cd ~/scratch/fred862/data/astro/pdr3_output/sampled_id'