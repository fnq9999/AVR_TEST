/************************************************
�ļ���AT24C01.c
��;��AT24C01��������
ע�⣺
������2008.1.26
�޸ģ�2008.1.26
Copy Right  (c)  www.avrvi.com  AVR����������
************************************************/
#include "..\config.h"
unsigned char syserr;
/*************************************************************************
** ��������: unsigned char * wt24c_fc(unsigned char *p, unsigned int ad, unsigned char n)
** ��������: ��24Cxxд������wt24c_h()��Ҫ���õĺ���
** �䡡��: 
** ���	 : ����д��n���ֽں�������ڴ�ָ��
** ȫ�ֱ���: ��
** ����ģ��: 
** ˵����
** ע�⣺
**************************************************************************/



unsigned char * wt24c_fc(unsigned char *p, unsigned int ad, unsigned char n)
{
	unsigned char t=0;

	#if e2prom<32
	t=ad>>8;
	t<<=1;
	#endif
	
	i2cstart();					//������ʼ�ź�
		
	if(i2cwt(W_ADD_COM+t)==SLAW)//����SLA_W, д�ֽ����������ַ
	{	
		#if e2prom>16
		i2cwt(ad>>8);			//ad_dst�ĸ�λ������
		#endif
		i2cwt(ad);				//ad_dst�ĵ�λ������
			
		for(;n>0;n--)			//����Ҫд�������
		{
		    i2cwt(*p);
			p++;
		}
	}
	else syserr=ERR_SLAW;		//д�ֽ����������ַ��
	
	i2cstop();
    delay_nms(6);						//��ʱ6ms
	
	return(p);
}

void pcf_set_byte(unsigned char p, unsigned int ad){
 unsigned char startcode=ad;
  wt24c_fc_pcf(&startcode,p,1);
}



unsigned char * wt24c_fc_pcf(unsigned char *p, unsigned int ad, unsigned char n)
{

	unsigned char t=0;
	#if e2prom<32
	t=ad>>8;
	t<<=1;
	#endif
	
	i2cstart();					//������ʼ�ź�
		
	if(i2cwt(W_ADD_COM_PCF+t)==SLAW)//����SLA_W, д�ֽ����������ַ
	{	
		#if e2prom>16
		i2cwt(ad>>8);			//ad_dst�ĸ�λ������
		#endif
		i2cwt(ad);				//ad_dst�ĵ�λ������
			
		for(;n>0;n--)			//����Ҫд�������
		{
		    i2cwt(*p);
			p++;
		}
	}
	else syserr=ERR_SLAW;		//д�ֽ����������ַ��
	
	i2cstop();
    delay_nms(6);						//��ʱ6ms
	
	return(p);
}


/*************************************************************************
** ��������: 
** ��������: ��24Cxxд������
** �䡡��: *p_rscҪ������ݵ������ڴ��ַָ��; ad_dstҪд�����ݵ�i2c�ĵ�ַ(˫�ֽ�); num���ݸ���
** ���	 : 
** ȫ�ֱ���: ��
** ����ģ��: 
** ˵����ad_dst: ad_dst+(num-1)���ܴ�����������ߵ�ַ; num����>0;
** ע�⣺
**************************************************************************/
void wt24c(unsigned char *p_rsc, unsigned int ad_dst, unsigned int num)
{
    unsigned int n;

    n=ad_dst/PAGE_SIZE;		//ȷ����ַ����ַ�Ĳ�
	if(n) n=(unsigned long)PAGE_SIZE*(n+1)-ad_dst;
	else n=PAGE_SIZE-ad_dst;
	
    if(n>=num)		//���ad_dst���ڵ����ݿ��ĩβ��ַ >= ad_dst + num, ��ֱ��д��num������
    {
	 	wt24c_fc(p_rsc, ad_dst, num);
    	if(syserr!=0) return;
    }
    else			//���ad_dst���ڵ����ݿ�ĩβ��ַ < ad_dst + num, ����д��ad_dst���ڵ����ݿ�ĩβ��ַ�� ad_dst ֮�������
    {
	    p_rsc=wt24c_fc(p_rsc, ad_dst, n);
    	if(syserr!=0) return;
		
		num-=n;     //����ʣ�����ݸ���
        ad_dst+=n;	//����ʣ�����ݵ���ʼ��ַ

        //��ʣ������д������
        while(num>=PAGE_SIZE)	//�Ȱ�PAGE_SIZEΪ����һҳһҳ��д��
        {
		 	p_rsc=wt24c_fc(p_rsc, ad_dst, PAGE_SIZE);
        	if(syserr!=0) return;
        	
            num-=PAGE_SIZE;		//����ʣ�����ݸ���
        	ad_dst+=PAGE_SIZE;	//����ʣ�����ݵ���ʼ��ַ
		}
        
		if(num)			//�����ʣ�µ�С��һ��PAGE_SIZE���ȵ�����д������
			wt24c_fc(p_rsc, ad_dst, num);
    }
}
/*************************************************************************
** ��������: 
** ��������: ��24cxx��������
** �䡡��: *p_dstҪ�������ݵ������ڴ��ַָ��; ad_rscҪ������ݵ�i2c�ĵ�ַ(����); num���ݸ���(����)
** ���	 : 
** ȫ�ֱ���: ��
** ����ģ��: 
** ˵����ad_dst+(num-1)���ܴ�����������ߵ�ַ; num����>0;
** ע�⣺
**************************************************************************/
void rd24c(unsigned char *p_dst, unsigned int ad_rsc, unsigned int num)
{


 	 
    unsigned char t=0;

	#if e2prom<32
	t=ad_rsc>>8;
	t<<=1;
	#endif
	
	i2cstart();					//������ʼ�ź�
		
	if(i2cwt(W_ADD_COM+t)==SLAW)//����SLA_W, д�ֽ����������ַ
	{	
		#if e2prom>16
		i2cwt(ad_rsc>>8);		//ad_rsc�ĸ�λ,  ����Ҫ�������ݵĵ�ַ
		#endif
		i2cwt(ad_rsc);			//ad_rsc�ĵ�λ
				
		i2cstart();				//�ٷ�����ʼ�ź�
		i2cwt(R_ADD_COM+t);		//����SLA_R, �������ֽڼ�������ַ
				
		for(;num>0;num--)
		{
		    *p_dst=i2crd();		//����������һ���ֽ�
			p_dst++;
		}
	}
	else syserr=ERR_SLAW;		//д�ֽ����������ַ���Է���Ӧ��
		
	i2cstop();

}







void rd24c_pcf(unsigned char *p_dst, unsigned int ad_rsc, unsigned int num)
{

    unsigned char t=0;
	#if e2prom<32
	t=ad_rsc>>8;
	t<<=1;
	#endif
	
	i2cstart();					//������ʼ�ź�
		
	if(i2cwt(W_ADD_COM_PCF+t)==SLAW)//����SLA_W, д�ֽ����������ַ
	{	
		#if e2prom>16
		i2cwt(ad_rsc>>8);		//ad_rsc�ĸ�λ,  ����Ҫ�������ݵĵ�ַ
		#endif
		i2cwt(ad_rsc);			//ad_rsc�ĵ�λ
				
		i2cstart();				//�ٷ�����ʼ�ź�
		i2cwt(R_ADD_COM_PCF+t);		//����SLA_R, �������ֽڼ�������ַ
				
		for(;num>0;num--)
		{
		    *p_dst=i2crd();		//����������һ���ֽ�
			p_dst++;
		}
	}
	else syserr=ERR_SLAW;		//д�ֽ����������ַ���Է���Ӧ��
		
	i2cstop();

}



void pcf_stop(void)
{
 unsigned char stopcode=0x20;
 wt24c_fc_pcf(&stopcode,0,1);
}
void pcf_start(void)
{
 unsigned char startcode=0x00;
  wt24c_fc_pcf(&startcode,0,1);
}

unsigned char * pcfset(unsigned char *p, unsigned int ad, unsigned char n){
		 pcf_stop();
		 wt24c_fc_pcf(p,ad,n);
		 pcf_start();
		 return(p);		 
}

void pcfread(unsigned char *p_dst, unsigned int ad_rsc, unsigned int num){	 
	 rd24c_pcf(p_dst,ad_rsc,num);
}


