module Ex7_1
# Generation of Fig7_1 with CairoMakie for Ex7_1
using Makie, CairoMakie, LaTeXStrings
using DescriptorSystems, Polynomials

Makie.inline!(false)
pexact = Vector(-25.:1.:-1.)
g = rtf(1,Polynomial(fromroots(pexact),:s))
poles = gpole(g)

fig = Figure(;font = "CMU Serif", fontsize=14, resolution = (600, 600))
ax = Axis(fig[1, 1], title = "Poles of 1/((s+1)(s+2)...(s+25))",
           ylabel = "Imaginary Axis",
           xlabel = "Real Axis")

h1 = scatter!(ax, real(pexact), imag(pexact), color = :orange, label = "True poles", 
            marker = :cross, strokewidth = 1, strokecolor = :black, markersize = 15)
h2 = scatter!(ax, real(poles), imag(poles), color = :red, label = "Perturbed poles")
h2.marker = :star6
xlims!.(ax, low = -30, high = 0) 
ylims!.(ax, low = -15, high =15) 

axislegend()


Fig7_1 = fig     

export Fig7_1


# comment out next line to save plot
#save("Fig7_1.pdf", fig, resolution = (600, 600))

end
using Main.Ex7_1
