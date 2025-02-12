# Windows-11-Lite

### **1. Acesse o Editor de Registro* - Pressione **Shift + F10** para abrir o Prompt de Comando.
- Digite `regedit` e pressione **Enter** para abrir o Editor de Registro

### **3. Modifique o Registro**
- Navegue até:  
  ```
  HKEY_LOCAL_MACHINE\SYSTEM\Setup
  ```
- Clique com o botão direito em **Setup** > **Novo** > **Chave** e nomeie como:
  ```
  LabConfig
  ```
- Dentro de `LabConfig`, crie **novos valores DWORD (32 bits)**:
  - **BypassTPMCheck** = `1`
  - **BypassSecureBootCheck** = `1`
  - **BypassRAMCheck** = `1`
  - **BypassCPUCheck** = `1`
- Feche o Editor de Registro.

### **2. Continue a instalação**
- Feche o Prompt de Comando e clique em **Voltar** depois tente instalar novamente

Isso permitirá instalar o Windows 11 em um PC sem TPM Secure Boot ou com processador incompatível
