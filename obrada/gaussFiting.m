function [amp, mi, sig] = gaussFiting(f,a)

    fitting = fit(f, a,'gauss1')
    
    mi = fitting.b1;
    sig = fitting.c1;
    amp1 = fitting.a1;
    %korekcija na 25%
    corr_factor = 0.25 * 1/sqrt(2/pi);
    amp2 = corr_factor * 1/(2*pi*sig)
    
    %amp = (amp1 + amp2) / 2;
    
    
    %korekcija na istu visinu
    maxH = 1 * exp(-(mi-mi).^2/(2*sig^2));
    %               (  0  )
    amp = 1/maxH;
    
    
    %amp = (1/maxH + amp) / 2;



    %gauss = 1/(2*pi*sd)*exp(-(f-mi).^2/(2*sd^2));
    
    %za ispis gauss
    %gauss = amp * exp(-(f-mi).^2/(2*sig^2));


end