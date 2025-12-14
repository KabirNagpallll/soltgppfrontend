//Generated Test by TG
//[[['VulnerableBank', 'contract', 126, 'state_type', 'state', 'uint', 'msg.value', 'address', 'msg.sender'], ['deposit_', 21, 'state_type', 'state', 'uint', 'msg.value', 'address', 'msg.sender'], ['withdraw_', 63, 'state_type', 'state', 'uint', 'msg.value', 'address', 'msg.sender', 'uint256', 'amount'], ['getBalance_', 78, 'state_type', 'state', 'uint', 'msg.value', 'address', 'msg.sender'], ['getTotalBalance_', 94, 'state_type', 'state', 'uint', 'msg.value', 'address', 'msg.sender'], ['emergencyStop_', 113, 'state_type', 'state', 'uint', 'msg.value', 'address', 'msg.sender'], ['contractInfo_', 125, 'state_type', 'state', 'uint', 'msg.value', 'address', 'msg.sender']]]
import "forge-std/Test.sol";
import "/home/kabir-nagpal/Desktop/soltgp/myproject/test6.sol";

contract test6_Test is Test {
	VulnerableBank vulnerablebank0;
	VulnerableBank vulnerablebank1;
	function setUp() public {
		vulnerablebank0 = new VulnerableBank();
		vulnerablebank1 = new VulnerableBank();
	}
	function test_test6_0() public {
		vm.prank(0x9b5a782bDdb2524517D3c9839aE4C9A8E06EDED7);
		vulnerablebank0.contractInfo(); // contractInfo__125("address(this).balance=38",0,0)
		vm.prank(0x87df976F24cF33a136b1141f845e8E96Ac002488);
		vulnerablebank0.emergencyStop(); // emergencyStop__113("address(this).balance=38",0,0)
	}
	function test_test6_1() public {
		vm.prank(0xa2714Faaba162C893972ED71f3Ee80288Ca5e5d8);
		vulnerablebank1.contractInfo(); // contractInfo__125("address(this).balance=0",0,0)
		vm.prank(0x0000000000000000000000000000000000000001);
		vulnerablebank1.withdraw(0); // withdraw__63("address(this).balance=0",0,1,0)
		vm.prank(0xc1DA9eBB80791147dB94ff0A854Db86878297B67);
		vulnerablebank1.getBalance(); // getBalance__78("address(this).balance=0",0,0)
	}
}
