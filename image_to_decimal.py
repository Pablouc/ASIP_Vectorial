import matplotlib.image as image

#int to binary
getbinary = lambda x, n: format(x, 'b').zfill(n)

nombre_imagen=input("Ingrese el nombre de la imagen a convertir \n")
img=image.imread(nombre_imagen)
imagen_lista=img.tolist()

#convertir a escala de grises
imagen_para_ram=[]

for i in range(len(imagen_lista)):
    vector=""
    cont=0
    for j in range(len(imagen_lista[0])):
        vector= vector + getbinary(imagen_lista[i][j][0],8)
        vector= vector + getbinary(imagen_lista[i][j][1],8)
        vector= vector + getbinary(imagen_lista[i][j][2],8)
        cont+=1
        if(cont%2==0):
            print(vector)
            cont=0
            imagen_para_ram.append(int(vector,2))
            vector=""
            
        

#print(imagen_para_ram)

f = open("ram.mif", "w")

f.write("""WIDTH=48;
DEPTH=65536;

ADDRESS_RADIX=UNS;
DATA_RADIX=UNS;

CONTENT BEGIN\n""")

cont=0


spaces="       :   "
for i in imagen_para_ram:
    spaces="       :   "
    spaces=spaces[len(str(cont)):]
    f.write("    "+str(cont)+spaces+str(i)+";\n")
    cont+=1
    
#writes position with 1's
#f.write("    "+str(cont)+spaces+str(int('000000010000000100000001000000010000000100000001',2))+";\n")

f.write("    ["+str(cont)+"..65535]  :   0;\n")
f.write("END;")

f.close()


