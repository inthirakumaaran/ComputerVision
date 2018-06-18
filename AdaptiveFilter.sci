//input a image ; window size m,n ; the noise variance


function adaptiveFilter(image,m,n,noisevari)
    p=image  
    a=floor(m/2);
    b=floor(n/2);
    matri=p
    for i=1+a:size(mtlb_double(p),1)-a
        for j=1+b:size(mtlb_double(p),2)-b
            temp = p(i-a:i+a,j-b:j+b);
            meann= mean(double(temp));
            localvari = variance(double(temp));
            if(localvari ==0) then
                localvari=1;
            end;
            matri(i,j)=(1-(noisevari/localvari))*p(i,j)+(noisevari/localvari)*meann;
        end
    end
    newimg=mtlb_s(p,matri);
    im3 = [p newimg];
    title("Old Image \t New image");
    imshow(im3);
    
endfunction
