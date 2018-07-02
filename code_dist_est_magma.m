%H=alist2sparse('LDPC_N128_K64_GF256_UNBPB_bi.alist');
%H=alist2sparse('Tanner_155_64.alist');
H=alist2sparse('wimax_672_0.83.alist');
%H=qc2sparse('42_22_192.txt');
%H=qc2sparse('42_22_2.txt');
%H=qc2sparse('42_22_6.txt');
%H=qc2sparse('42_22_48.txt');
[h, g] = h2g(H,2) ;
%sparse(mod(g*h',2))
fileID = fopen('t.magma','w');

fprintf(fileID,'K := GF(2);\n vsp := sub< VectorSpace(K, %d) |',size(g,2));


for i = 1:size(g,1)
    fprintf(fileID,'[');
    for j = 1:size(g,2)
    if(j==size(g,2)) fprintf(fileID,' %d ',g(i,j));
    else fprintf(fileID,' %d, ',g(i,j));
    end
    end
if(i ==size(g,1)) fprintf(fileID,'] >;\n');
else  fprintf(fileID,'],');
end
end
fprintf(fileID,'print vsp;\n C := LinearCode(vsp); \n print C; \n SetVerbose("Code", true); \n ');
%fprintf(fileID,'SetSeed(1); \n MinimumWeight(C); \n WeightDistribution(C);');
fprintf(fileID,'SetSeed(1); \n MinimumWeight(C); \n');


fclose(fileID);

