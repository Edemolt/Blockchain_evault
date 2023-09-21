// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ECertificateContract.sol";


contract ServiceAccessControl {
    ECertificateContract private certificateContract;

    constructor(address certificateContractAddress) {
        certificateContract = ECertificateContract(certificateContractAddress);
    }

    function validateCertificate(uint256 tokenId) internal view returns (bool) {
        // Perform certificate validation logic here.
        string memory certificateDetails = certificateContract.getCertificateDetails(tokenId);
        return bytes(certificateDetails).length > 0;
    }

    function grantServiceAccess(uint256 tokenId) external view returns (bool) {
        // Assume validation must be successful before granting access.
        return validateCertificate(tokenId);
    }
}
