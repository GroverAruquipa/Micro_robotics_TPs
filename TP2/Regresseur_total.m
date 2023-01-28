function [ Jparam_total ] = Regresseur_total(les_qi, les_cTm, param_i)
    for LegNo=1:40
        Jparam_i(LegNo,:)=Regresseur_indiv(les_qi(LegNo),les_cTm(:,:,LegNo),param_i);
    end
    Jparam_total=Jparam_i;
end