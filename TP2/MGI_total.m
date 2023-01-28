function [ les_ecarts_i ] = MGI_total(les_qi, les_cTm, param_i) %Function which calculates the total error
    aux=size(les_qi);
    for LegNo=1:aux(1)
        ecart(LegNo)=MGI_indiv(les_qi(LegNo,1), les_cTm(:,:,LegNo), param_i);
    end
    les_ecarts_i=ecart;

end

