require 'torch'
package.path = package.path .. ';flags/?.lua'
require 'SPENOptions'


local cmd = torch.CmdLine()

SPENOptions:add_general_spen_options(cmd)

--Architecture Options
cmd:option('-feature_hid_size',50,'dimensionality of feature maps')
cmd:option('-energy_hid_size',25,'dimensionality of feature maps in energy')
cmd:option('-dropout',0,"droupout rate")
cmd:option('-features_nonlinearity',"ReLU","what kind of nonlinearity to use")
cmd:option('-energy_nonlinearity',"SoftPlus","what kind of nonlinearity to use. Don't use ReLU if you want the finite differences to behave reasonably.")

cmd:option('-input_size',"",'dimensionality of the inputs')
cmd:option('-feature_depth',2,'depth of feature MLP')
cmd:option('-energy_depth',2,'depth of feature MLP')

cmd:option('-label_dim',-1,'dimensionality of the labels')
cmd:option('-conditional_label_energy',1,"whether to use conditional label energy. usually don't want to use both this and the label_energy")


cmd:option('-serialize',"","where to write out the serialized options")
local params = cmd:parse(arg)

torch.save(params.serialize,params)


