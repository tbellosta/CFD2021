function order = reorderPoints(x,y)

np = length(x);
order = ones(size(x));

id = randi([1,np],1,1);
order(1) = id;
order(1) = 50;

xx = x; yy = y;
xx(id) = 999; yy(id) = 999;
for i = 1:np-1
   dist = sqrt(100*(xx-x(order(i))).^2 + (yy-y(order(i))).^2);
   dist(dist == 0) = 100;
   [~,id] = min(dist);
   order(i+1) = id;
   xx(id) = 999;
   yy(id) = 999;
end


end