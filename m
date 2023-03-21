Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8004E6C69CC
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 23 Mar 2023 14:45:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pfLFx-0006GE-9X
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 23 Mar 2023 13:45:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <piotrgorski@cachyos.org>) id 1peXHI-0005It-NS
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 21 Mar 2023 08:23:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ETMQewYqFOxyEeyfz++LRASMN6UldVLdJx3vLdRJ+U8=; b=eJX4tKgiEpLOls7bhk358RUgLe
 ohDCge2Z1xMgX716kRC+pXh8RjQzJ8lZTazGwjL9BOsQ4UVpwqyugEKiXd5wOVkV9mbrgUzYjXCN2
 fb6ycTjTWoeD9zOePygUMxJUgHNVVlyEDqbREVe6s7RU3zGqJOgMoTNPqvlvbAKTPKqQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ETMQewYqFOxyEeyfz++LRASMN6UldVLdJx3vLdRJ+U8=; b=a0cFt6tKOSthi6Nq8x1hBy5OOO
 529VR3Hd9YppWsHiXAIvSc9aZOtDdLQU/YdOW+U/KgvIOh37O2yEnrflkCODN0zdZ51QliZv5UbI2
 NfbWteyVsSZE+rIrhzD6kdEGhsmlXpjk6Ldi3ByCPeS/HQHF3QJ8DKDDSqK+x6lUdcBc=;
Received: from [202.61.224.105] (helo=mail.ptr1337.dev)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1peXHD-00F3fe-IR for kgdb-bugreport@lists.sourceforge.net;
 Tue, 21 Mar 2023 08:23:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 570FE2800C1; Tue, 21 Mar 2023 09:23:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cachyos.org; s=dkim;
 t=1679386994; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=ETMQewYqFOxyEeyfz++LRASMN6UldVLdJx3vLdRJ+U8=;
 b=mTDUcu6EONftfdBT/BsJcZJqtvG9Hk0H4pY103xW/8Mr82A+Qx85EGQ7yY0DlbFTzgcCDj
 j/wcpNDwLJWATK8eozJ5mYt5NKPtlTaXEw2xOBWWYeglb6LqyZ5s3qNLNEnUjG1majMlRr
 Cnl5tN4nJWK9dcY5BLw7UFgqCrpqR014t3U65ZDUf3/8uQAcX4yeoU9fVUVc6MlTn+gelG
 XOm5xQ8cRcojI3L8pczOamv8AWo+L0SsKPxa/wHJvyQJ0bKsTG2bQ7TmR29UY2nqblZFC3
 KRfSvqdqkLzvIXWmmeZb5ib31/IcuebKi/kZkw+Nxld2ZqwsUHz5furCUGKlug==
Message-ID: <e30b31c9-9b18-80a3-8ff0-97b958ab0b8f@cachyos.org>
Date: Tue, 21 Mar 2023 09:23:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
 Joe Lawrence <joe.lawrence@redhat.com>, Chris Down <chris@chrisdown.name>,
 Nick Terrell <terrelln@fb.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, live-patching@vger.kernel.org,
 bpf@vger.kernel.org, llvm@lists.linux.dev
References: <20230315125256.22772-1-fmdefrancesco@gmail.com>
Content-Language: pl-PL, en-US
In-Reply-To: <20230315125256.22772-1-fmdefrancesco@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Reviewed-by: Piotr Gorski <piotrgorski@cachyos.org> W dniu
    15.03.2023 o 13:52, Fabio M. De Francesco pisze: > Use kunmap_local() to
    unmap pages locally mapped with kmap_local_page(). > > kunmap_local() must
    be called on the kernel virtual address retu [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  1.3 RDNS_NONE              Delivered to internal network by a host with no rDNS
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1peXHD-00F3fe-IR
X-Mailman-Approved-At: Thu, 23 Mar 2023 13:45:23 +0000
Subject: Re: [Kgdb-bugreport] [PATCH] module/decompress: Never use kunmap()
 for local un-mappings
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
From: Piotr Gorski via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Piotr Gorski <piotrgorski@cachyos.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Ira Weiny <ira.weiny@intel.com>, Stephen Boyd <swboyd@chromium.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

UmV2aWV3ZWQtYnk6IFBpb3RyIEdvcnNraSA8cGlvdHJnb3Jza2lAY2FjaHlvcy5vcmc+CgpXIGRu
aXUgMTUuMDMuMjAyMyBvwqAxMzo1MiwgRmFiaW8gTS4gRGUgRnJhbmNlc2NvIHBpc3plOgo+IFVz
ZSBrdW5tYXBfbG9jYWwoKSB0byB1bm1hcCBwYWdlcyBsb2NhbGx5IG1hcHBlZCB3aXRoIGttYXBf
bG9jYWxfcGFnZSgpLgo+Cj4ga3VubWFwX2xvY2FsKCkgbXVzdCBiZSBjYWxsZWQgb24gdGhlIGtl
cm5lbCB2aXJ0dWFsIGFkZHJlc3MgcmV0dXJuZWQgYnkKPiBrbWFwX2xvY2FsX3BhZ2UoKSwgZGlm
ZmVyZW50bHkgZnJvbSBob3cgd2UgdXNlIGt1bm1hcCgpIHdoaWNoIGluc3RlYWQKPiBleHBlY3Rz
IHRoZSBtYXBwZWQgcGFnZSBhcyBpdHMgYXJndW1lbnQuCj4KPiBJbiBtb2R1bGVfenN0ZF9kZWNv
bXByZXNzKCkgd2UgY3VycmVudGx5IG1hcCB3aXRoIGttYXBfbG9jYWxfcGFnZSgpIGFuZAo+IHVu
bWFwIHdpdGgga3VubWFwKCkuIFRoaXMgYnJlYWtzIHRoZSBjb2RlIGFuZCBzbyBpdCBzaG91bGQg
YmUgZml4ZWQuCj4KPiBDYzogUGlvdHIgR29yc2tpIDxwaW90cmdvcnNraUBjYWNoeW9zLm9yZz4K
PiBDYzogRG1pdHJ5IFRvcm9raG92IDxkbWl0cnkudG9yb2tob3ZAZ21haWwuY29tPgo+IENjOiBM
dWlzIENoYW1iZXJsYWluIDxtY2dyb2ZAa2VybmVsLm9yZz4KPiBDYzogU3RlcGhlbiBCb3lkIDxz
d2JveWRAY2hyb21pdW0ub3JnPgo+IENjOiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+
Cj4gRml4ZXM6IDE2OWE1OGFkODI0ZCAoIm1vZHVsZS9kZWNvbXByZXNzOiBTdXBwb3J0IHpzdGQg
aW4ta2VybmVsIGRlY29tcHJlc3Npb24iKQo+IFNpZ25lZC1vZmYtYnk6IEZhYmlvIE0uIERlIEZy
YW5jZXNjbyA8Zm1kZWZyYW5jZXNjb0BnbWFpbC5jb20+Cj4gLS0tCj4gICBrZXJuZWwvbW9kdWxl
L2RlY29tcHJlc3MuYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9tb2R1bGUvZGVjb21wcmVzcy5j
IGIva2VybmVsL21vZHVsZS9kZWNvbXByZXNzLmMKPiBpbmRleCBiYjc5YWMxYTZkOGYuLjdkZGM4
N2JlZTI3NCAxMDA2NDQKPiAtLS0gYS9rZXJuZWwvbW9kdWxlL2RlY29tcHJlc3MuYwo+ICsrKyBi
L2tlcm5lbC9tb2R1bGUvZGVjb21wcmVzcy5jCj4gQEAgLTI2Nyw3ICsyNjcsNyBAQCBzdGF0aWMg
c3NpemVfdCBtb2R1bGVfenN0ZF9kZWNvbXByZXNzKHN0cnVjdCBsb2FkX2luZm8gKmluZm8sCj4g
ICAJCXpzdGRfZGVjLnNpemUgPSBQQUdFX1NJWkU7Cj4gICAKPiAgIAkJcmV0ID0genN0ZF9kZWNv
bXByZXNzX3N0cmVhbShkc3RyZWFtLCAmenN0ZF9kZWMsICZ6c3RkX2J1Zik7Cj4gLQkJa3VubWFw
KHBhZ2UpOwo+ICsJCWt1bm1hcF9sb2NhbCh6c3RkX2RlYy5kc3QpOwo+ICAgCQlyZXR2YWwgPSB6
c3RkX2dldF9lcnJvcl9jb2RlKHJldCk7Cj4gICAJCWlmIChyZXR2YWwpCj4gICAJCQlicmVhazsK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1
Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVw
b3J0Cg==
