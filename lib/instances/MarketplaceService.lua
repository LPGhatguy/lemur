local BaseInstance = import("./BaseInstance")
local MarketplaceService = BaseInstance:extend("MarketplaceService")

function MarketplaceService.prototype:GetProductInfo(assetId, intotype)
	return {
		AssetId = assetId,
	}
end


return MarketplaceService