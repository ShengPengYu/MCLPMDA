function [result] = IntegratedSimilarity(C,R,O)

result = (C+R+O);
[m,n] = size(O);
for i=1:m
    for j = 1:n
        if(O(i,j) == 0)
            result(i,j)= (C(i,j)+R(i,j));
        end
    end
end

end