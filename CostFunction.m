function err = CostFunction(var, BlurredImage, RealImage)
    PSF1 = fspecial('motion', 20 * var(1) + 1, 90 * var(2));
    [n1, n2] = size(PSF1);
    PSF = zeros(n1 + 2, n2 + 2);
    PSF(2: end -1, 2: end - 1) = PSF1;
    newBlurred = edgetaper(BlurredImage, PSF);
    PredictedImage = deconvlucy(newBlurred, PSF, 10);
    err = -1 * sum(sum(abs(RealImage - PredictedImage)));
end