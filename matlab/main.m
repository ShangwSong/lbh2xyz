% main
file=dir('*.xyz');
fm=0;
neu=[];
fid=fopen('neu.txt','a');
for i=1:size(file)
    cor=load(file(i).name);
    neu(i,:)=lbh2neu(cor,fm);
    file(i).name
    fn{i}={file(i).name(1:4)};
    n=num2str(neu(i,1),'%3.7f');
    e=num2str(neu(i,2),'%3.7f');
    u=num2str(neu(i,3),'%3.7f');
    str=strcat(n,32,e,32,u,32,file(i).name(1:4));
    fprintf(fid,'\r\n%s',str)
end
fclose(fid
