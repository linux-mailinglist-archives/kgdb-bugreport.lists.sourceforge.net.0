Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9E5241AAB
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 11 Aug 2020 13:54:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k5SrT-00039T-MF
	for lists+kgdb-bugreport@lfdr.de; Tue, 11 Aug 2020 11:54:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+20cdd0.be9e4a-kgdb-bugreport=lists.sourceforge.net@mg.codeaurora.org>)
 id 1k5SrR-00039D-4h
 for kgdb-bugreport@lists.sourceforge.net; Tue, 11 Aug 2020 11:54:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BbgBllrGixV1VF5JA2+YDRoW43ZC6IFJKZUmb8h6+nw=; b=jA18hhN44OQD7hPeeQxnG1lWKH
 mDv64fySPYEYMUDrqboiwtSJldDkajblw0VDP47+zt8m8sN0ke+sy47ba/uFqTXo6LtX+zZMtZmsg
 rwan0B+2IsTCUHbYAERalRwZVL2Ylh4JKV/Ap7604nQCCw0ArjXOcN2VH3fAKJIe83Gg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BbgBllrGixV1VF5JA2+YDRoW43ZC6IFJKZUmb8h6+nw=; b=V/P7I0K4RzDjy9KiiK67aaqA97
 qIsKpTFA4KhRbUqIHFbyj2eTutMmASoPTl4uq2ZwoHzDHilCS2c2CaCedLRXR4s6iWCobkV2mgd8W
 tqEWBWunPYzfQcAUCoA++Dd4YGBO2sF98VV6uONZyA1HEbM7PBo3wrbH7qs36QY/8Owg=;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k5SrK-005UNK-AT
 for kgdb-bugreport@lists.sourceforge.net; Tue, 11 Aug 2020 11:54:33 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1597146866; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=BbgBllrGixV1VF5JA2+YDRoW43ZC6IFJKZUmb8h6+nw=;
 b=g9ZqpRoE6RNlHBSp4DqqUD8RNDJwZF9I1s0bfplhHSbe+cWBhwAWGs4QUrTL3CZljweuKrUg
 G/muig8zi00tEd7jvKtaGi3p8CLuPZVHviygMPL56q4rHMKgBCXeE22pLV1Tf49oqvg/22VO
 oVjytsnCUw1iYyo9Ge3tkRQopIE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJiNjhjNiIsICJrZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQiLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-west-2.postgun.com with SMTP id
 5f3286eb4c787f237b268b3d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 11 Aug 2020 11:54:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E80F9C433A0; Tue, 11 Aug 2020 11:54:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
 SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.100] (unknown [157.43.31.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akashast)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9B877C433C6;
 Tue, 11 Aug 2020 11:54:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9B877C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=akashast@codeaurora.org
To: Doug Anderson <dianders@chromium.org>
References: <20200806221904.1.I4455ff86f0ef5281c2a0cd0a4712db614548a5ca@changeid>
 <adaef6bf-7887-feea-fedf-d3bc5566bb9d@codeaurora.org>
 <CAD=FV=X8tNpmkSrEjXgKPKsBOZfjt8aVQe47gzi5FvPqdOQN+A@mail.gmail.com>
From: Akash Asthana <akashast@codeaurora.org>
Message-ID: <b4cd8daf-ef37-4cc1-546e-ba46cb19392a@codeaurora.org>
Date: Tue, 11 Aug 2020 17:24:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=X8tNpmkSrEjXgKPKsBOZfjt8aVQe47gzi5FvPqdOQN+A@mail.gmail.com>
Content-Language: en-US
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: crrev.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [69.72.43.7 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [69.72.43.7 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1k5SrK-005UNK-AT
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Evan Green <evgreen@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-serial@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 Mukesh Savaliya <msavaliy@codeaurora.org>, Jiri Slaby <jirislaby@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Ck9uIDgvMTEvMjAyMCAyOjU2IEFNLCBEb3VnIEFuZGVyc29uIHdyb3RlOgo+IEhpLAo+Cj4gT24g
TW9uLCBBdWcgMTAsIDIwMjAgYXQgNTozMiBBTSBBa2FzaCBBc3RoYW5hIDxha2FzaGFzdEBjb2Rl
YXVyb3JhLm9yZz4gd3JvdGU6Cj4+IEhpIERvdWcsCj4+Cj4+IE9uIDgvNy8yMDIwIDEwOjQ5IEFN
LCBEb3VnbGFzIEFuZGVyc29uIHdyb3RlOgo+Pj4gVGhlIGNvbW1pdCBlNDJkNmMzZWMwYzcgKCJz
ZXJpYWw6IHFjb21fZ2VuaV9zZXJpYWw6IE1ha2Uga2dkYiB3b3JrCj4+PiBldmVuIGlmIFVBUlQg
aXNuJ3QgY29uc29sZSIpIHdvcmtlZCBwcmV0dHkgd2VsbCBhbmQgSSd2ZSBiZWVuIGRvaW5nIGEK
Pj4+IGxvdCBvZiBkZWJ1Z2dpbmcgd2l0aCBpdC4gIEhvd2V2ZXIsIHJlY2VudGx5IEkgdHlwZWQg
ImRtZXNnIiBpbiBrZGIKPj4+IGFuZCB0aGVuIGhlbGQgdGhlIHNwYWNlIGtleSBkb3duIHRvIHNj
cm9sbCB0aHJvdWdoIHRoZSBwYWdpbmF0aW9uLiAgTXkKPj4+IGRldmljZSBodW5nLiAgVGhpcyB3
YXMgcmVwZWF0YWJsZSBhbmQgSSBmb3VuZCB0aGF0IGl0IHdhcyBpbnRyb2R1Y2VkCj4+PiB3aXRo
IHRoZSBhZm9yZW1lbnRpb25lZCBjb21taXQuCj4+Pgo+Pj4gSXQgdHVybnMgb3V0IHRoYXQgdGhl
cmUgYXJlIHNvbWUgc3RyYW5nZSBib3VuZGFyeSBjYXNlcyBpbiBnZW5pIHdoZXJlCj4+PiBpbiBz
b21lIHdlaXJkIHNpdHVhdGlvbnMgaXQgd2lsbCBzaWduYWwgUlhfTEFTVCBidXQgdGhlbiB3aWxs
IHB1dCAwIGluCj4+PiBSWF9MQVNUX0JZVEUuICBUaGlzIG1lYW5zIHRoYXQgdGhlIGVudGlyZSBs
YXN0IEZJRk8gZW50cnkgaXMgdmFsaWQuCj4+IElNTyB0aGF0IG1lYW5zIHdlIHJlY2VpdmVkIGEg
d29yZCBpbiBSWF9GSUZPIGFuZCBpdCBpcyB0aGUgbGFzdCB3b3JkCj4+IGhlbmNlIFJYX0xBU1Qg
Yml0IGlzIHNldC4KPiBXaGF0IHlvdSBzYXkgd291bGQgbWFrZSBsb2dpY2FsIHNlbnNlLCBidXQg
aXQncyBub3QgaG93IEkgaGF2ZQo+IG9ic2VydmVkIGdlbmkgdG8gd29yay4gIFNlZSBiZWxvdy4K
Pgo+Cj4+IFJYX0xBU1RfQllURSBpcyAwIG1lYW5zIG5vbmUgb2YgdGhlIGJ5dGVzIGFyZSB2YWxp
ZCBpbiB0aGUgbGFzdCB3b3JkLgo+IFRoaXMgd291bGQgaW1wbHkgdGhhdCBxY29tX2dlbmlfc2Vy
aWFsX2hhbmRsZV9yeCgpIGlzIGFsc28gYnJva2VuCj4gdGhvdWdoLCB3b3VsZG4ndCBpdD8gIFNw
ZWNpZmljYWxseSBpbWFnaW5lIHRoYXQgV09SRF9DTlQgaXMgMSBhbmQKPiBSWF9MQVNUIGlzIHNl
dCBhbmQgUlhfTEFTVF9CWVRFX1ZBTElEIGlzIHRydWUuICBIZXJlJ3MgdGhlIGxvZ2ljIGZyb20K
PiB0aGF0IGZ1bmN0aW9uOgo+Cj4gICAgdG90YWxfYnl0ZXMgPSBCWVRFU19QRVJfRklGT19XT1JE
ICogKHdvcmRfY250IC0gMSk7Cj4gICAgaWYgKGxhc3Rfd29yZF9wYXJ0aWFsICYmIGxhc3Rfd29y
ZF9ieXRlX2NudCkKPiAgICAgIHRvdGFsX2J5dGVzICs9IGxhc3Rfd29yZF9ieXRlX2NudDsKPiAg
ICBlbHNlCj4gICAgICB0b3RhbF9ieXRlcyArPSBCWVRFU19QRVJfRklGT19XT1JEOwo+ICAgIHBv
cnQtPmhhbmRsZV9yeCh1cG9ydCwgdG90YWxfYnl0ZXMsIGRyb3ApOwo+Cj4gQXMgeW91IGNhbiBz
ZWUgdGhhdCBsb2dpYyB3aWxsIHNldCAidG90YWxfYnl0ZXMiIHRvIDQgaW4gdGhlIGNhc2UgSSdt
Cj4gdGFsa2luZyBhYm91dC4KClllYWggSU1PIGFzIHBlciB0aGVvcnkgdGhpcyBzaG91bGQgYWxz
byBiZSBjb3JyZWN0ZWQgYnV0IHNpbmNlIHlvdSBoYXZlIAphbHJlYWR5IHB1bGxlZCBvdXQgZmV3
IGV4cGVyaW1lbnQgdG8gcHJvdmUgZ2FyYmFnZSBkYXRhIGlzc3VlKHdoaWNoIEnCoCAKd2FzIHN1
c3BlY3RpbmcpIGlzIG5vdCBzZWVuLgoKSXQncyBhbHJlYWR5IGNvbnNpc3RlbnQgd2l0aCBleGlz
dGluZyBsb2dpYyBhbmQgaXQgYmVoYXZlcyB3ZWxsIApwcmFjdGljYWxseSAuIFNvIHRoZSBjaGFu
Z2VzIGNvdWxkIGJlIG1lcmdlLiBNZWFud2hpbGUgSSBhbSBjaGVja2luZyAKd2l0aCBIVyB0ZWFt
IHRvIGdldCBjbGFyaXR5LgoKPgo+Cj4+IEluIHN1Y2ggc2NlbmFyaW8gd2Ugc2hvdWxkIGp1c3Qg
cmVhZCBSWF9GSUZPIGJ1ZmZlciAodG8gZW1wdHkgaXQpLAo+PiBkaXNjYXJkIHRoZSB3b3JkIGFu
ZCByZXR1cm4gTk9fUE9MTF9DSEFSLiBTb21ldGhpbmcgbGlrZSBiZWxvdy4KPj4KPj4gLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+Cj4+ICAgICAgICAgICAgICAgICAg
IGVsc2UKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICBwcml2YXRlX2RhdGEtPnBvbGxfY2Fj
aGVkX2J5dGVzX2NudCA9IDQ7Cj4+Cj4+ICAgICAgICAgICAgICAgICAgIHByaXZhdGVfZGF0YS0+
cG9sbF9jYWNoZWRfYnl0ZXMgPQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlYWRsKHVw
b3J0LT5tZW1iYXNlICsgU0VfR0VOSV9SWF9GSUZPbik7Cj4+ICAgICAgICAgICB9Cj4+Cj4+ICsg
ICAgICAgIGlmICghcHJpdmF0ZV9kYXRhLT5wb2xsX2NhY2hlZF9ieXRlc19jbnQpCj4+ICsgICAg
ICAgICAgICAgIHJldHVybiBOT19QT0xMX0NIQVI7Cj4+ICAgICAgICAgICBwcml2YXRlX2RhdGEt
PnBvbGxfY2FjaGVkX2J5dGVzX2NudC0tOwo+PiAgICAgICAgICAgcmV0ID0gcHJpdmF0ZV9kYXRh
LT5wb2xsX2NhY2hlZF9ieXRlcyAmIDB4ZmY7Cj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KPj4KPj4gUGxlYXNlIGxldCBtZSBrbm93IHdoZXRoZXIgYWJvdmUg
Y29kZSBoZWxwcy4KPiBZb3VyIGNvZGUgd2lsbCBhdm9pZCB0aGUgaGFuZy4gIFllcy4gIC4uLmJ1
dCBpdCB3aWxsIGRyb3AgYnl0ZXMuICBJCj4gZGV2aXNlZCBhIHF1aWNrLW4tZGlydHkgdGVzdC4g
IEhlcmUncyBhIHRlc3Qgb2YgeW91ciBjb2RlOgpJIGFzc3VtZWQgdGhvc2UgYXMgaW52YWxpZCBi
eXRlcyBhbmQgZG9uJ3Qgd2FudGVkIHRvIHJlYWQgdGhlbSBzbyB5ZWFoIApkcm9wcGluZyBvZiBi
eXRlcyB3YXMgZXhwZWN0ZWQuCj4KPiBodHRwczovL2NycmV2LmNvbS9jLzIzNDY4ODYKPgo+IC4u
LmFuZCBoZXJlJ3MgYSB0ZXN0IG9mIG15IGNvZGU6Cj4KPiBodHRwczovL2NycmV2LmNvbS9jLzIz
NDY4ODQKPgo+IEkgaGFkIHRvIGtlZXAgYSBidWZmZXIgYXJvdW5kIHNpbmNlIGl0J3MgaGFyZCB0
byBkZWJ1ZyB0aGUgc2VyaWFsCj4gZHJpdmVyLiAgSW4gYm90aCBjYXNlcyBJIHB1dCAiRE9VRyIg
aW50byB0aGUgYnVmZmVyIHdoZW4gSSBkZXRlY3QgdGhpcwo+IGNhc2UuICBJZiBteSB0aGVvcnkg
YWJvdXQgaG93IGdlbmkgd29ya2VkIHdhcyB3cm9uZyB0aGVuIHdlIHNob3VsZAo+IGV4cGVjdCB0
byBzZWUgc29tZSBnYXJiYWdlIGluIHRoZSBidWZmZXIgcmlnaHQgYWZ0ZXIgdGhlIERPVUcsIHJp
Z2h0Pwo+IC4uLmJ1dCBteSBjb2RlIGdldHMgdGhlIGFscGhhYmV0IGluIG5pY2Ugc2VxdWVuY2Uu
ICBZb3VyIGNvZGUgZHJvcHMgNAo+IGJ5dGVzLgpZZWFoIEkgd2FzIGV4cGVjdGluZyBnYXJiYWdl
IGRhdGEuCj4KPgo+IE5PVEU6IHdoaWxlIHBva2luZyBhcm91bmQgd2l0aCB0aGUgYWJvdmUgdHdv
IHRlc3QgcGF0Y2hlcyBJIGZvdW5kIGl0Cj4gd2FzIHByZXR0eSBlYXN5IHRvIGdldCBnZW5pIHRv
IGRyb3AgYnl0ZXMgLyBoaXQgb3ZlcmZsb3cgY2FzZXMgYW5kCj4gYWxzbyB0byBpbnNlcnQgYm9n
dXMgMCBieXRlcyBpbiB0aGUgc3RyZWFtIChJIGJlbGlldmUgdGhlc2UgYXJlCj4gcmVsYXRlZCku
ICBJIHdhcyBhYmxlIHRvIHJlcHJvZHVjZSB0aGlzOgo+ICogV2l0aCAke1NVQkpFQ1R9IHBhdGNo
IGluIHBsYWNlLgo+ICogV2l0aCB5b3VyIHByb3Bvc2VkIHBhdGNoLgo+ICogV2l0aCB0aGUgcmVj
ZW50ICJnZW5pIiBwYXRjaGVzIHJldmVydGVkIChpbiBvdGhlciB3b3JkcyBiYWNrIHRvIDEKPiBi
eXRlIHBlciBGSUZPIGVudHJ5KS4KPgo+IEl0J3Mgbm90IHRlcnJpYmx5IHN1cnByaXNpbmcgdGhh
dCB3ZSdyZSBvdmVyZmxvd2luZyBzaW5jZSBJIGJlbGlldmUKPiBrZ2RiIGlzbid0IHRvbyBrZWVu
IHRvIHJlYWQgY2hhcmFjdGVycyBhdCB0aGUgc2FtZSB0aW1lIGl0J3Mgd3JpdGluZy4KPiBUaGF0
IGRvZXNuJ3QgZXhwbGFpbiB0aGUgd2VpcmQgMC1ieXRlcyB0aGF0IGdlbmkgc2VlbWVkIHRvIGJl
Cj4gaW5zZXJ0aW5nLCBidXQgYXQgbGVhc3QgaXQgd291bGQgZXhwbGFpbiB0aGUgb3ZlcmZsb3dz
LiAgSG93ZXZlciwgZXZlbgo+IGFmdGVyIEkgZml4ZWQgdGhpcyBJIF9zdGlsbF8gd2FzIGdldHRp
bmcgcHJvYmxlbXMuICBTcGVjaWZpY2FsbHkgZ2VuaQo+IHNlZW1lZCB0byBiZSBoaWRpbmcgYnl0
ZXMgZnJvbSBtZSB1bnRpbCBpdCB3YXMgdG9vIGxhdGUuICBJIHB1dAo+IGxvZ2dpbmcgaW4gYW5k
IHdvdWxkIHNlZSB0aGlzOgo+Cj4gMSB3b3JkIGluIEZJRk8gLSB3eHl6Cj4gMSB3b3JkIGluIEZJ
Rk8gKGxhc3Qgc2V0LCBsYXN0IEZJRk8gaGFzIDEgYnl0ZSkgLSBcbgo+IENoZWNrIGFnYWluLCBz
dGlsbCAwIGJ5dGVzIGluIEZJRk8KPiBTdWRkZW5seSAxNiBieXRlcyBhcmUgaW4gRklGTyBhbmQg
U19SWF9GSUZPX1dSX0VSUl9FTiBpcyBzZXQuCgpSWCBkYXRhIGZpcnN0IHN0b3JlZCBpbiBSWF9B
U1lOQ19GSUZPIHRoZW4gaXQncyB0cmFuc2ZlcmVkIHRvIFJYX0ZJRk8KCldoZW4gZ2V0X2NoYXIg
aXMgY2FsbGVkIGFuZCB3ZSBvYnNlcnZlIDAgYnl0ZXMgaW4gUlhfRklGTywgbW9zdCBwcm9iYWJs
eSAKZGF0YSBpcyBub3QgdHJhbnNmZXJlZCBmcm9tIFJYX0FTWU5DX0ZJRk8gdG8gUlhfRklGTy4K
CkJJVFMgMjc6MjUgb2YgU0VfR0VOSV9SWF9GSUZPX1NUQVRVUyByZWdpc3RlciBzaG93cyBSWF9B
U1lOQ19GSUZPIHdvcmQgCmNvdW50LgoKCj4KPiBJIHNwZW50IGEgd2hvbGUgYnVuY2ggb2YgdGlt
ZSBwb2tpbmcgYXQgdGhpcyBhbmQgY291bGRuJ3QgZmluZCBhbnkKPiBzb3J0IG9mIHdvcmthcm91
bmQuICBQcmVzdW1hYmx5IGdlbmkgaXMgdGFraW5nIHNvbWUgdGltZSBiZXR3ZWVuIG1lCj4gcmVh
ZGluZyB0aGUgbGFzdCB3b3JkIG91dCBvZiB0aGUgRklGTyBmcm9tIHRoZSAicHJldmlvdXMiIHBh
Y2tldCBhbmQKPiB0aGVuIHRyYW5zaXRpb25pbmcgdG8gdGhlIG5ldyBwYWNrZXQuICBJIGZvdW5k
IGEgbG90IG9mIHJlZmVyZW5jZXMgdG8KPiB0aGlzIHByb2Nlc3MgaW4gdGhlIGhhcmR3YXJlIHJl
Z2lzdGVyIGRlc2NyaXB0aW9uIChzZWUgR0VOSV9DRkdfUkVHNjksCj4gZm9yIGluc3RhbmNlKSwg
YnV0IEkgY291bGRuJ3QgbWFuYWdlIHRvIG1ha2UgdGhlIGtpY2sgdG8gaGFwcGVuIGFueQo+IGZh
c3Rlci4gIFByZXN1bWFibHkgdGhpcyBpc24ndCBhIHByb2JsZW0gZm9yIHRoaW5ncyBsaWtlIEJs
dWV0b290aAo+IHNpbmNlIGZsb3cgY29udHJvbCBzYXZlcyB0aGVtLiAgLi4uYW5kIEkgZ3Vlc3Mg
dGhpcyBpc24ndCBhIHByb2JsZW0gaW4KPiBwcmFjdGljZSBiZWNhdXNlIHdlIHVzdWFsbHkgX3Nl
bmRfIGEgbG90IG9mIGRhdGEgdG8gdGhlIGhvc3QgZm9yCj4gY29uc29sZS9rZ2RiIGFuZCBpdCdz
IG9ubHkgdGhlIGhvc3QgPT4gRFVUIHBhdGggdGhhdCBoYXMgcHJvYmxlbXMuCj4KPgo+PiBJIGFt
IG5vdCBzdXJlIGFib3V0IHdoYXQgYWxsIHNjZW5hcmlvIGNhbiBsZWFkcyB0byB0aGlzIGJlaGF2
aW9yIGZyb20KPj4gaGFyZHdhcmUsIEkgd2lsbCB0cnkgdG8gZ2V0IGFuIGFuc3dlciBmcm9tIGhh
cmR3YXJlIHRlYW0uCj4+Cj4+IEFueSBlcnJvciBiaXQgd2FzIHNldCBmb3IgU0VfR0VOSV9TX0lS
UV9TVEFUVVMgJiBTRV9HRU5JX01fSVJRX1NUQVRVUwo+PiByZWdpc3RlcnM/Cj4gQXMgcGVyIGFi
b3ZlIEkgY2FuIHNlZSBvdmVyZmxvd3MgaW4gbXkgdGVzdCBjYXNlIGFuZCBnZW5pIHNlZW1zIHRv
IGJlCj4gYmVoYXZpbmcgcHJldHR5IGJhZGx5LiAgSWYgeW91IGhhdmUgaWRlYXMgb24gaG93IHRv
IGZpeCB0aGlzIEknZCBsb3ZlCj4gaXQuICBIb3dldmVyLCBpdCBzdGlsbCBzZWVtcyBsaWtlIG15
IHBhdGNoIGlzIHJpZ2h0IGJlY2F1c2UgKGF0IGxlYXN0Cj4gaW4gdGhlIGNhc2VzIEkgdGVzdGVk
KSBpdCBhdm9pZHMgZHJvcHBpbmcgYnl0ZXMgaW4gc29tZSBjYXNlcy4gIEl0Cj4gYWxzbyBtYXRj
aGVzIGhvdyBxY29tX2dlbmlfc2VyaWFsX2hhbmRsZV9yeCgpIHdvcmtzIGFuZCBpZiB0aGF0IHdh
cwo+IGJyb2tlbiB3ZSdkIGhhdmUgbm90aWNlZCBieSBub3cuCgpSZXZpZXdlZC1ieTogQWthc2gg
QXN0aGFuYSA8YWthc2hhc3RAY29kZWF1cm9yYS5vcmc+CgoKPgo+PiBJIGd1ZXNzIHRoZSBoYW5n
IHdhcyBzZWVuIGJlY2F1c2UgKnBvbGxfY2FjaGVkX2J5dGVzX2NudCogaXMgdW5zaWduZWQKPj4g
aW50IGFuZCBpdCdzIHZhbHVlIHdhcyAwLCB3aGVuIGl0J3MgZGVjcmVtZW50ZWQgYnkgMSBpdCdz
IHZhbHVlIGJlY29tZQo+PiAnNDI5NDk2NzI5NScgKHZlcnkgbGFyZ2UpIGFuZCBkdW1teSBSWCAo
MHgwMCkgd291bGQgaGFwcGVuIHRoYXQKPj4KPj4gbWFueSB0aW1lcyBiZWZvcmUgcmVhZGluZyBh
bnkgYWN0dWFsIFJYIHRyYW5zZmVycy9ieXRlcy4KPiBSaWdodC4gIFRoYXQgd291bGQgYmUgd2h5
IGl0IHdhcyBoYW5naW5nLgo+Cj4KPiAtRG91ZwoKLS0gClRoZSBRdWFsY29tbSBJbm5vdmF0aW9u
IENlbnRlciwgSW5jLiBpcyBhIG1lbWJlciBvZiB0aGUgQ29kZSBBdXJvcmEgRm9ydW0sXG5hIExp
bnV4IEZvdW5kYXRpb24gQ29sbGFib3JhdGl2ZSBQcm9qZWN0CgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlz
dApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
