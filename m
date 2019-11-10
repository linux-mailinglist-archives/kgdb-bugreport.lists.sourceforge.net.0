Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBBFF6327
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 10 Nov 2019 03:50:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iTdIl-0005n6-QG
	for lists+kgdb-bugreport@lfdr.de; Sun, 10 Nov 2019 02:50:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1iTdIh-0005me-Fu
 for kgdb-bugreport@lists.sourceforge.net; Sun, 10 Nov 2019 02:50:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c1dTncOSdr+IapvtHpk/fki/A0ZN+fTVObIzhZFP1HM=; b=CpRkT/AEbnvflTHvokzc2gRP1Y
 ViKN6ksWkPyYcs2VBaQdcjG8DCBwDU7lFyBoRWx8nfm8WqqJdWKDYTeKuxcR5P6ZKvG4fd0ZY2HWQ
 W6/7YAVpJrkap06G7lC3l/B9b5Ph+aUq9nOnPt/oih+4ZS9XW10N4kRjk0wSSmKOetIY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c1dTncOSdr+IapvtHpk/fki/A0ZN+fTVObIzhZFP1HM=; b=QfEUc5mqvSna+w9eDS3ZHKmqH2
 ncwCOEeuCPFY/Uw9KzNalCM5UWYz+QDMfRgh75UtXOO1bW5yZARUWtWmTEut58PSTWpoXNtLolt2E
 6gGAsZvgMSYzVZbzi4HhuXFFi9bIZyYVvIg5jV0Rob3f4txWCNz2oktYQRbTW2Y0D24g=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iTdId-00CT1N-Av
 for kgdb-bugreport@lists.sourceforge.net; Sun, 10 Nov 2019 02:50:01 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9D0AB22595;
 Sun, 10 Nov 2019 02:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573354193;
 bh=BpAp6XH2uSlXE1JsPhrWmKuprZOOpZwsT4hO8c9rf1g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CwFllO4md0/aP1yVmk+DZSOcrulkzi1fsJdOb2tDvz5j8kem4lQM9GbOuEvpZn8iE
 4I4jZVG0X1d3V3cn23tKmk11xOSVS+x79XhYvxvtOXdcC7CywGwxWdaNmBq8ODB50d
 gXZ3LvyWE21erI21D6s5M1Jr+I16V9a+As9LmVq4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sat,  9 Nov 2019 21:48:20 -0500
Message-Id: <20191110024846.32598-41-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191110024846.32598-1-sashal@kernel.org>
References: <20191110024846.32598-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iTdId-00CT1N-Av
Subject: [Kgdb-bugreport] [PATCH AUTOSEL 4.9 41/66] misc: kgdbts: Fix
 restrict error
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Laura Abbott <labbott@redhat.com>, kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

RnJvbTogTGF1cmEgQWJib3R0IDxsYWJib3R0QHJlZGhhdC5jb20+CgpbIFVwc3RyZWFtIGNvbW1p
dCBmYTAyMThlZjczM2U2ZjI0N2ExYTM5ODZlM2ViMTI0NjAwNjRhYzc3IF0KCmtnZGJ0cyBjdXJy
ZW50IGZhaWxzIHdoZW4gY29tcGlsZWQgd2l0aCByZXN0cmljdDoKCmRyaXZlcnMvbWlzYy9rZ2Ri
dHMuYzogSW4gZnVuY3Rpb24g4oCYY29uZmlndXJlX2tnZGJ0c+KAmToKZHJpdmVycy9taXNjL2tn
ZGJ0cy5jOjEwNzA6MjogZXJyb3I6IOKAmHN0cmNweeKAmSBzb3VyY2UgYXJndW1lbnQgaXMgdGhl
IHNhbWUgYXMgZGVzdGluYXRpb24gWy1XZXJyb3I9cmVzdHJpY3RdCiAgc3RyY3B5KGNvbmZpZywg
b3B0KTsKICBefn5+fn5+fn5+fn5+fn5+fn5+CgpBcyB0aGUgZXJyb3Igc2F5cywgY29uZmlnIGlz
IGJlaW5nIHVzZWQgaW4gYm90aCB0aGUgc291cmNlIGFuZCBkZXN0aW5hdGlvbi4KUmVmYWN0b3Ig
dGhlIGNvZGUgdG8gYXZvaWQgdGhlIGV4dHJhIGNvcHkgYW5kIHB1dCB0aGUgcGFyc2luZyBjbG9z
ZXIgdG8KdGhlIGFjdHVhbCBsb2NhdGlvbi4KClNpZ25lZC1vZmYtYnk6IExhdXJhIEFiYm90dCA8
bGFiYm90dEByZWRoYXQuY29tPgpBY2tlZC1ieTogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhv
bXBzb25AbGluYXJvLm9yZz4KU2lnbmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVn
a2hAbGludXhmb3VuZGF0aW9uLm9yZz4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hh
bEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvbWlzYy9rZ2RidHMuYyB8IDE2ICsrKysrKy0tLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWlzYy9rZ2RidHMuYyBiL2RyaXZlcnMvbWlzYy9rZ2RidHMu
YwppbmRleCBiYjNhNzZhZDgwZGEyLi5mYzhjYjg1NWM2ZTY2IDEwMDY0NAotLS0gYS9kcml2ZXJz
L21pc2Mva2dkYnRzLmMKKysrIGIvZHJpdmVycy9taXNjL2tnZGJ0cy5jCkBAIC05NzksNiArOTc5
LDEyIEBAIHN0YXRpYyB2b2lkIGtnZGJ0c19ydW5fdGVzdHModm9pZCkKIAlpbnQgbm1pX3NsZWVw
ID0gMDsKIAlpbnQgaTsKIAorCXZlcmJvc2UgPSAwOworCWlmIChzdHJzdHIoY29uZmlnLCAiVjEi
KSkKKwkJdmVyYm9zZSA9IDE7CisJaWYgKHN0cnN0cihjb25maWcsICJWMiIpKQorCQl2ZXJib3Nl
ID0gMjsKKwogCXB0ciA9IHN0cmNocihjb25maWcsICdGJyk7CiAJaWYgKHB0cikKIAkJZm9ya190
ZXN0ID0gc2ltcGxlX3N0cnRvbChwdHIgKyAxLCBOVUxMLCAxMCk7CkBAIC0xMDYyLDEzICsxMDY4
LDYgQEAgc3RhdGljIGludCBrZ2RidHNfb3B0aW9uX3NldHVwKGNoYXIgKm9wdCkKIAkJcmV0dXJu
IC1FTk9TUEM7CiAJfQogCXN0cmNweShjb25maWcsIG9wdCk7Ci0KLQl2ZXJib3NlID0gMDsKLQlp
ZiAoc3Ryc3RyKGNvbmZpZywgIlYxIikpCi0JCXZlcmJvc2UgPSAxOwotCWlmIChzdHJzdHIoY29u
ZmlnLCAiVjIiKSkKLQkJdmVyYm9zZSA9IDI7Ci0KIAlyZXR1cm4gMDsKIH0KIApAQCAtMTA4MCw5
ICsxMDc5LDYgQEAgc3RhdGljIGludCBjb25maWd1cmVfa2dkYnRzKHZvaWQpCiAKIAlpZiAoIXN0
cmxlbihjb25maWcpIHx8IGlzc3BhY2UoY29uZmlnWzBdKSkKIAkJZ290byBub2NvbmZpZzsKLQll
cnIgPSBrZ2RidHNfb3B0aW9uX3NldHVwKGNvbmZpZyk7Ci0JaWYgKGVycikKLQkJZ290byBub2Nv
bmZpZzsKIAogCWZpbmFsX2FjayA9IDA7CiAJcnVuX3BsYW50X2FuZF9kZXRhY2hfdGVzdCgxKTsK
LS0gCjIuMjAuMQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2tnZGItYnVncmVwb3J0Cg==
