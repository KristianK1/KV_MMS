function [amp, mi, sig] = gaussFiting(f,a)

    fitting = fit(f, a,'gauss1')
    
    mi = fitting.b1;
    sig = fitting.c1;
    
    
    %korekcija na 25%
    corr_factor = 0.25 * 1/sqrt(2/pi) 
    
    amp = corr_factor * 1/(2*pi*sig)
    
    %gauss = 1/(2*pi*sd)*exp(-(f-mu).^2/(2*sd^2));
    
    %za ispis gauss
    %gauss = amp * exp(-(f-mi).^2/(2*sig^2));


end