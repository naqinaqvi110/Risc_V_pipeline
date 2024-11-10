module sign_extend(In,Imm_Ext,ImmSrc);

        output [31:0] Imm_Ext;
        input  [31:0] In;
        input [1:0] ImmSrc;


        assign Imm_Ext = (ImmSrc == 2'b01) ? ({{20{In[31]}},In[31:25],In[11:7]}):
                         (ImmSrc == 2'b00 ) ? ({{20{In[31]}},In[31:20]}) :
                         (ImmSrc == 2'b10) ? {{20{In[31]}},In[7],In[30:25],In[11:8],1'b0} : {{12{In[31]}},In[19:12],In[20],In[30:21],1'b0};




endmodule 