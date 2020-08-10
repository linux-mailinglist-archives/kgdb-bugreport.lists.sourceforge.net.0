Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B52A3240671
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 10 Aug 2020 15:10:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k57Zg-0000kR-6t
	for lists+kgdb-bugreport@lfdr.de; Mon, 10 Aug 2020 13:10:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+20cdd0.be9e4a-kgdb-bugreport=lists.sourceforge.net@mg.codeaurora.org>)
 id 1k56yk-0007Sv-Mo
 for kgdb-bugreport@lists.sourceforge.net; Mon, 10 Aug 2020 12:32:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YATn2IQenXC1AZhlnO1R/hOYwlccU9AexyRTM+qvl5Y=; b=hqEZ1RlqRFB8Fy0isWFIJMGcO9
 q0thdo7LJMcp9kJq5bY9w+glWxdxiIyNCls1zSs0DRLJZtR7wNneWK3eTe20yFC1FmhcNeQisKG+b
 TJgxqcR2O4lktKDie5796DGfYsRgqKbSxY9p1iivvZHPfdmzGacM2gwhSghsfId5Vrz8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YATn2IQenXC1AZhlnO1R/hOYwlccU9AexyRTM+qvl5Y=; b=RLnBVFcLCP1mlTBw3Ml8KIiJ5Q
 GcKX/OdME7Buqm3eXr2zP7Z+khRdiWzlSPxQIKBEZwde9qDChk7EUPFl13ThQqANhvgB88OVT3kSE
 kuGUYVW5BgyX7woFKfVOwimx+dVwehx2tAro0JWfxYz/MvDePclqXsAitpxzBJkLuHNg=;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k56yZ-00FUjL-Cy
 for kgdb-bugreport@lists.sourceforge.net; Mon, 10 Aug 2020 12:32:38 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1597062751; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=YATn2IQenXC1AZhlnO1R/hOYwlccU9AexyRTM+qvl5Y=;
 b=IXDecK0k80U1oSD9G51+9lHcguMhWjilneqsdumFeQo8fuQeUF23eyZCV2zoct8PdWxm3eiz
 WTKfF+qd/huqw3HiRuEMDUEFhB1NMkL4WmAGdzvYlg9Gyh8zvMTHPNW9VMDqfgKnSRFHUzs9
 bNEzljAudKMyx5Q4hNq12vcibmI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJiNjhjNiIsICJrZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQiLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-west-2.postgun.com with SMTP id
 5f313e4903528d4024ed019e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 10 Aug 2020 12:32:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E98E1C43395; Mon, 10 Aug 2020 12:32:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
 SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.100] (unknown [47.8.236.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akashast)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 04822C433C6;
 Mon, 10 Aug 2020 12:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 04822C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=akashast@codeaurora.org
To: Douglas Anderson <dianders@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20200806221904.1.I4455ff86f0ef5281c2a0cd0a4712db614548a5ca@changeid>
From: Akash Asthana <akashast@codeaurora.org>
Message-ID: <adaef6bf-7887-feea-fedf-d3bc5566bb9d@codeaurora.org>
Date: Mon, 10 Aug 2020 18:01:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200806221904.1.I4455ff86f0ef5281c2a0cd0a4712db614548a5ca@changeid>
Content-Language: en-US
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [69.72.43.7 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [69.72.43.7 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1k56yZ-00FUjL-Cy
X-Mailman-Approved-At: Mon, 10 Aug 2020 13:09:03 +0000
Subject: Re: [Kgdb-bugreport] [PATCH] serial: qcom_geni_serial: Fix recent
 kdb hang
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-serial@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Mukesh Savaliya <msavaliy@codeaurora.org>, Jiri Slaby <jirislaby@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGkgRG91ZywKCk9uIDgvNy8yMDIwIDEwOjQ5IEFNLCBEb3VnbGFzIEFuZGVyc29uIHdyb3RlOgo+
IFRoZSBjb21taXQgZTQyZDZjM2VjMGM3ICgic2VyaWFsOiBxY29tX2dlbmlfc2VyaWFsOiBNYWtl
IGtnZGIgd29yawo+IGV2ZW4gaWYgVUFSVCBpc24ndCBjb25zb2xlIikgd29ya2VkIHByZXR0eSB3
ZWxsIGFuZCBJJ3ZlIGJlZW4gZG9pbmcgYQo+IGxvdCBvZiBkZWJ1Z2dpbmcgd2l0aCBpdC4gIEhv
d2V2ZXIsIHJlY2VudGx5IEkgdHlwZWQgImRtZXNnIiBpbiBrZGIKPiBhbmQgdGhlbiBoZWxkIHRo
ZSBzcGFjZSBrZXkgZG93biB0byBzY3JvbGwgdGhyb3VnaCB0aGUgcGFnaW5hdGlvbi4gIE15Cj4g
ZGV2aWNlIGh1bmcuICBUaGlzIHdhcyByZXBlYXRhYmxlIGFuZCBJIGZvdW5kIHRoYXQgaXQgd2Fz
IGludHJvZHVjZWQKPiB3aXRoIHRoZSBhZm9yZW1lbnRpb25lZCBjb21taXQuCj4KPiBJdCB0dXJu
cyBvdXQgdGhhdCB0aGVyZSBhcmUgc29tZSBzdHJhbmdlIGJvdW5kYXJ5IGNhc2VzIGluIGdlbmkg
d2hlcmUKPiBpbiBzb21lIHdlaXJkIHNpdHVhdGlvbnMgaXQgd2lsbCBzaWduYWwgUlhfTEFTVCBi
dXQgdGhlbiB3aWxsIHB1dCAwIGluCj4gUlhfTEFTVF9CWVRFLiAgVGhpcyBtZWFucyB0aGF0IHRo
ZSBlbnRpcmUgbGFzdCBGSUZPIGVudHJ5IGlzIHZhbGlkLgoKSU1PIHRoYXQgbWVhbnMgd2UgcmVj
ZWl2ZWQgYSB3b3JkIGluIFJYX0ZJRk8gYW5kIGl0IGlzIHRoZSBsYXN0IHdvcmQgCmhlbmNlIFJY
X0xBU1QgYml0IGlzIHNldC4KClJYX0xBU1RfQllURSBpcyAwIG1lYW5zIG5vbmUgb2YgdGhlIGJ5
dGVzIGFyZSB2YWxpZCBpbiB0aGUgbGFzdCB3b3JkLgoKSW4gc3VjaCBzY2VuYXJpbyB3ZSBzaG91
bGQganVzdCByZWFkIFJYX0ZJRk8gYnVmZmVyICh0byBlbXB0eSBpdCksIApkaXNjYXJkIHRoZSB3
b3JkIGFuZCByZXR1cm4gTk9fUE9MTF9DSEFSLiBTb21ldGhpbmcgbGlrZSBiZWxvdy4KCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBlbHNlCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHByaXZhdGVfZGF0YS0+cG9sbF9jYWNoZWRfYnl0ZXNfY250ID0gNDsKCiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJpdmF0ZV9kYXRhLT5wb2xsX2NhY2hlZF9ieXRlcyA9
CiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlYWRsKHVw
b3J0LT5tZW1iYXNlICsgU0VfR0VOSV9SWF9GSUZPbik7CiDCoMKgwqDCoMKgwqDCoCB9CgorwqDC
oMKgwqDCoMKgwqAgaWYgKCFwcml2YXRlX2RhdGEtPnBvbGxfY2FjaGVkX2J5dGVzX2NudCkKKyDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIE5PX1BPTExfQ0hBUjsKIMKgwqDCoMKgwqDC
oMKgIHByaXZhdGVfZGF0YS0+cG9sbF9jYWNoZWRfYnl0ZXNfY250LS07CiDCoMKgwqDCoMKgwqDC
oCByZXQgPSBwcml2YXRlX2RhdGEtPnBvbGxfY2FjaGVkX2J5dGVzICYgMHhmZjsKLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKUGxlYXNlIGxldCBtZSBrbm93IHdo
ZXRoZXIgYWJvdmUgY29kZSBoZWxwcy4KCkkgYW0gbm90IHN1cmUgYWJvdXQgd2hhdCBhbGwgc2Nl
bmFyaW8gY2FuIGxlYWRzIHRvIHRoaXMgYmVoYXZpb3IgZnJvbSAKaGFyZHdhcmUsIEkgd2lsbCB0
cnkgdG8gZ2V0IGFuIGFuc3dlciBmcm9tIGhhcmR3YXJlIHRlYW0uCgpBbnkgZXJyb3IgYml0IHdh
cyBzZXQgZm9yIFNFX0dFTklfU19JUlFfU1RBVFVTICYgU0VfR0VOSV9NX0lSUV9TVEFUVVMgCnJl
Z2lzdGVycz8KCgpJIGd1ZXNzIHRoZSBoYW5nIHdhcyBzZWVuIGJlY2F1c2UgKnBvbGxfY2FjaGVk
X2J5dGVzX2NudCogaXMgdW5zaWduZWQgCmludCBhbmQgaXQncyB2YWx1ZSB3YXMgMCwgd2hlbiBp
dCdzIGRlY3JlbWVudGVkIGJ5IDEgaXQncyB2YWx1ZSBiZWNvbWUgCic0Mjk0OTY3Mjk1JyAodmVy
eSBsYXJnZSkgYW5kIGR1bW15IFJYICgweDAwKSB3b3VsZCBoYXBwZW4gdGhhdAoKbWFueSB0aW1l
cyBiZWZvcmUgcmVhZGluZyBhbnkgYWN0dWFsIFJYIHRyYW5zZmVycy9ieXRlcy4KClJlZ2FyZHMs
CgpBa2FzaAoKCj4gVGhpcyB3ZWlyZCBjb3JuZXIgY2FzZSBpcyBoYW5kbGVkIGluIHFjb21fZ2Vu
aV9zZXJpYWxfaGFuZGxlX3J4KCkKPiB3aGVyZSB5b3UgY2FuIHNlZSB0aGF0IHdlIG9ubHkgaG9u
b3IgUlhfTEFTVF9CWVRFIGlmIFJYX0xBU1QgaXMgc2V0Cj4gX2FuZF8gUlhfTEFTVF9CWVRFIGlz
IG5vbi16ZXJvLiAgSWYgZWl0aGVyIG9mIHRoZXNlIGlzIG5vdCB0cnVlIHdlIHVzZQo+IEJZVEVT
X1BFUl9GSUZPX1dPUkQgKDQpIGZvciB0aGUgc2l6ZSBvZiB0aGUgbGFzdCBGSUZPIHdvcmQuCj4K
PiBMZXQncyBmaXgga2dkYi4gIFdoaWxlIGF0IGl0LCBhbHNvIHVzZSB0aGUgcHJvcGVyICNkZWZp
bmUgZm9yIDQuCj4KPiBGaXhlczogZTQyZDZjM2VjMGM3ICgic2VyaWFsOiBxY29tX2dlbmlfc2Vy
aWFsOiBNYWtlIGtnZGIgd29yayBldmVuIGlmIFVBUlQgaXNuJ3QgY29uc29sZSIpCj4gU2lnbmVk
LW9mZi1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgo+IC0tLQo+
Cj4gICBkcml2ZXJzL3R0eS9zZXJpYWwvcWNvbV9nZW5pX3NlcmlhbC5jIHwgOSArKysrKysrLS0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvc2VyaWFsL3Fjb21fZ2VuaV9zZXJpYWwuYyBiL2RyaXZl
cnMvdHR5L3NlcmlhbC9xY29tX2dlbmlfc2VyaWFsLmMKPiBpbmRleCAwN2I3YjZiMDViOGIuLmUy
NzA3NzY1NjkzOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvcWNvbV9nZW5pX3Nl
cmlhbC5jCj4gKysrIGIvZHJpdmVycy90dHkvc2VyaWFsL3Fjb21fZ2VuaV9zZXJpYWwuYwo+IEBA
IC0zNjEsMTEgKzM2MSwxNiBAQCBzdGF0aWMgaW50IHFjb21fZ2VuaV9zZXJpYWxfZ2V0X2NoYXIo
c3RydWN0IHVhcnRfcG9ydCAqdXBvcnQpCj4gICAJCQlyZXR1cm4gTk9fUE9MTF9DSEFSOwo+ICAg
Cj4gICAJCWlmICh3b3JkX2NudCA9PSAxICYmIChzdGF0dXMgJiBSWF9MQVNUKSkKPiArCQkJLyoK
PiArCQkJICogTk9URTogSWYgUlhfTEFTVF9CWVRFX1ZBTElEIGlzIDAgaXQgbmVlZHMgdG8gYmUK
PiArCQkJICogdHJlYXRlZCBhcyBpZiBpdCB3YXMgQllURVNfUEVSX0ZJRk9fV09SRC4KPiArCQkJ
ICovCj4gICAJCQlwcml2YXRlX2RhdGEtPnBvbGxfY2FjaGVkX2J5dGVzX2NudCA9Cj4gICAJCQkJ
KHN0YXR1cyAmIFJYX0xBU1RfQllURV9WQUxJRF9NU0spID4+Cj4gICAJCQkJUlhfTEFTVF9CWVRF
X1ZBTElEX1NIRlQ7Cj4gLQkJZWxzZQo+IC0JCQlwcml2YXRlX2RhdGEtPnBvbGxfY2FjaGVkX2J5
dGVzX2NudCA9IDQ7Cj4gKwo+ICsJCWlmIChwcml2YXRlX2RhdGEtPnBvbGxfY2FjaGVkX2J5dGVz
X2NudCA9PSAwKQo+ICsJCQlwcml2YXRlX2RhdGEtPnBvbGxfY2FjaGVkX2J5dGVzX2NudCA9IEJZ
VEVTX1BFUl9GSUZPX1dPUkQ7Cj4gICAKPiAgIAkJcHJpdmF0ZV9kYXRhLT5wb2xsX2NhY2hlZF9i
eXRlcyA9Cj4gICAJCQlyZWFkbCh1cG9ydC0+bWVtYmFzZSArIFNFX0dFTklfUlhfRklGT24pOwoK
LS0gClRoZSBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBpcyBhIG1lbWJlciBvZiB0
aGUgQ29kZSBBdXJvcmEgRm9ydW0sXG5hIExpbnV4IEZvdW5kYXRpb24gQ29sbGFib3JhdGl2ZSBQ
cm9qZWN0CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dk
Yi1idWdyZXBvcnQK
