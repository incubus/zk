require 'spec_helper'

module ZK
  describe 'Exceptions' do
    describe 'KeeperException.by_code' do
      it %[should return the exception class for a known code] do
        expect(Exceptions::KeeperException.by_code(Exceptions::CONNECTIONLOSS)).to eq(Exceptions::ConnectionLoss)
      end

      it %[should raise UnknownCode for a code it has no class for] do
        # ZTHROTTLEDOP, which newer servers return
        expect { Exceptions::KeeperException.by_code(-127) }.to raise_error(Exceptions::UnknownCode, /API ERROR/)
      end
    end
  end
end
