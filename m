Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7DA8AE25F
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 23 Apr 2024 12:37:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rzDWf-00075i-Of
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 23 Apr 2024 10:37:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rzDWe-00075Y-Ma
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 23 Apr 2024 10:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f1GtuAnGuJIGmi4Nj3I/YO3XIATvrNjSsCDRrmOKdN4=; b=mkTVK/aCfqHyTomGKazsk6Lzas
 +1g0OzWM0lAnmvPhUyrHSJT/BXDTdRO3a7a2seSlUCXfEa5FLtAUbR/9AcFDvYMY8mYeE6yDToiV3
 8T1b/xgRNjigzKFItw8QVh8/IzFbAG2k8Cx/ZQNYeKh0taunr+fFhqUSJKtUVopIg14I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f1GtuAnGuJIGmi4Nj3I/YO3XIATvrNjSsCDRrmOKdN4=; b=PxYC+kkg4L4UZ7hjKjK0bwV+/2
 awwLUg3RiVpewtrKwE+A8jC/X3RnbrulwFLzlaEIsdVzMJTCZAt14Yy3+Bfd962XInm/fiMNjIe/y
 aY0IT7JBotCfDVX1203rRrITDqmTUYJbQYXE7a2Yqz7lNiW/hENyOVcq5Wi4PEtZtGW4=;
Received: from mail-wm1-f53.google.com ([209.85.128.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rzDWd-0004V4-Jd for kgdb-bugreport@lists.sourceforge.net;
 Tue, 23 Apr 2024 10:37:24 +0000
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-41a4f291f9dso15465875e9.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 23 Apr 2024 03:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713868638; x=1714473438; darn=lists.sourceforge.net;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=f1GtuAnGuJIGmi4Nj3I/YO3XIATvrNjSsCDRrmOKdN4=;
 b=PRm06o9R9a5BoVZgkZOVV/fP5UwRnDLVRFlIt+/7USPm+3oejLTrhe+qKD0TIEj+++
 xHa/ooigdT/sOXWmc4rZ3+N7HRKrNmDTO3yMODWV2IhbOvPQQv08rg64sJzThRMuzBOc
 tTvsSrshWIEIJGSLDUN9WGP3/beT17+pJ5kSkgel37U03EJgpePO5KD1RJbUioNd4nDl
 GZfwigv0Zcws2t7RyWPqATByZuDXzvSvQ7/NN20+uU0gKwnPXmoeg3zx/4Vot0pXEde9
 arz3Znkprb82AEb+NeXPP3ypduoAsfbCYBqN1RBGqB7kFLJUxZvF2wBQrAYcHAPnekYl
 ibvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713868638; x=1714473438;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f1GtuAnGuJIGmi4Nj3I/YO3XIATvrNjSsCDRrmOKdN4=;
 b=DWLinM97qVFDOO3aacBylC2/a29b9pT7Gc0Qz5yn03JwPuCklNcN68Xn9wsx/JRr+4
 KIqXNRi5XctOvb60VNzWKli2l1WtKd6ouavX3ipNMoJDUW2Y+T+7xhzBk61ELCCKWSZc
 tkTtsafnRGmZw2h49YTO8AMeeNCSnNntpCdbImR5dp3QG7fcGjMXXTiDYmrTONZg/DRh
 1rGFv4vqla4wlNQ9nYTED1YpF97CbxxSisABKscPTwybsblXmd5O0irnuwtDLIZYMpEJ
 5xvClljfRwoXVo++TWAjfZ+l1EIr/1Ddkmu5Yzdrdt3n4NF+NTo7YM4O7CwcgHzqalb3
 kZKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkLCsz0XY+pCTKQVYf36FnLts+kY++95leild1xt2CoJKdf6+RcllKBSovVQzOYSNG1FlEu6ErdgNWKUxtwvKYbin+A1wZHLXqsXQNyM76HwUTQg8=
X-Gm-Message-State: AOJu0YxgjkTm48ka/m4ie6VfiVjaNjXSrZ4qfnJnhC2mhzjtI3MZNitj
 +xMrZUW/vfcNr0AYwkLSGuPKu2H4glz3nYBx1XXB1L7+kVLPA/mczo/l82xnV90=
X-Google-Smtp-Source: AGHT+IEH4u6S6D3wRTzN4LoL8l6ZdRFVF5WlLyRo5GBP3Ye47cGr849oyji7omkAYtv3mN9qFEIfTw==
X-Received: by 2002:a05:600c:3c95:b0:419:f126:a46d with SMTP id
 bg21-20020a05600c3c9500b00419f126a46dmr6803385wmb.30.1713868637635; 
 Tue, 23 Apr 2024 03:37:17 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a05600c1f0600b0041a7aa23dbfsm5003551wmb.48.2024.04.23.03.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 03:37:16 -0700 (PDT)
Date: Tue, 23 Apr 2024 11:37:14 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20240423103714.GB1567803@aspen.lan>
References: <20240422-kgdb_read_refactor-v2-0-ed51f7d145fe@linaro.org>
 <20240422-kgdb_read_refactor-v2-2-ed51f7d145fe@linaro.org>
 <CAD=FV=VXFHqOatn3cvwvYCey53+zuzB7ie4gYdvDVbfGL=Qm1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=VXFHqOatn3cvwvYCey53+zuzB7ie4gYdvDVbfGL=Qm1Q@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Apr 22, 2024 at 04:52:04PM -0700, Doug Anderson wrote:
    > Hi, > > On Mon, Apr 22, 2024 at 9:37 AM Daniel Thompson > <daniel.thompson@linaro.org>
    wrote: > > > > Currently when kdb_read() needs [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.53 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1rzDWd-0004V4-Jd
Subject: Re: [Kgdb-bugreport] [PATCH v2 2/7] kdb: Use format-strings rather
 than '\0' injection in kdb_read()
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
 stable@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gTW9uLCBBcHIgMjIsIDIwMjQgYXQgMDQ6NTI6MDRQTSAtMDcwMCwgRG91ZyBBbmRlcnNvbiB3
cm90ZToKPiBIaSwKPgo+IE9uIE1vbiwgQXByIDIyLCAyMDI0IGF0IDk6MzfigK9BTSBEYW5pZWwg
VGhvbXBzb24KPiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4KPiA+IEN1
cnJlbnRseSB3aGVuIGtkYl9yZWFkKCkgbmVlZHMgdG8gcmVwb3NpdGlvbiB0aGUgY3Vyc29yIGl0
IHVzZXMgY29weSBhbmQKPiA+IHBhc3RlIGNvZGUgdGhhdCB3b3JrcyBieSBpbmplY3RpbmcgYW4g
J1wwJyBhdCB0aGUgY3Vyc29yIHBvc2l0aW9uIGJlZm9yZQo+ID4gZGVsaXZlcmluZyBhIGNhcnJp
YWdlLXJldHVybiBhbmQgcmVwcmludGluZyB0aGUgbGluZSAod2hpY2ggc3RvcHMgYXQgdGhlCj4g
PiAnXDAnKS4KPiA+Cj4gPiBUaWR5IHVwIHRoZSBjb2RlIGJ5IGhvaXN0aW5nIHRoZSBjb3B5IGFu
ZCBwYXN0ZSBjb2RlIGludG8gYW4gYXBwcm9wcmlhdGVseQo+ID4gbmFtZWQgZnVuY3Rpb24uIEFk
ZGl0aW9uYWxseSBsZXQncyByZXBsYWNlIHRoZSAnXDAnIGluamVjdGlvbiB3aXRoIGEKPiA+IHBy
b3BlciBmaWVsZCB3aWR0aCBwYXJhbWV0ZXIgc28gdGhhdCB0aGUgc3RyaW5nIHdpbGwgYmUgYWJy
aWRnZWQgZHVyaW5nCj4gPiBmb3JtYXR0aW5nIGluc3RlYWQuCj4gPgo+ID4gQ2M6IHN0YWJsZUB2
Z2VyLmtlcm5lbC5vcmcgIyBOb3QgYSBidWcgZml4IGJ1dCBpdCBpcyBuZWVkZWQgZm9yIGxhdGVy
IGJ1ZyBmaXhlcwo+ID4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhv
bXBzb25AbGluYXJvLm9yZz4KPiA+IC0tLQo+ID4gIGtlcm5lbC9kZWJ1Zy9rZGIva2RiX2lvLmMg
fCAzNCArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDE0IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQo+Cj4gTG9va3MgbGlrZSBhIG5p
Y2UgZml4LCBidXQgSSB0aGluayB0aGlzJ2xsIGNyZWF0ZSBhIGNvbXBpbGUgd2FybmluZyBvbgo+
IHNvbWUgY29tcGlsZXJzLiBUaGUgdmFyaWFibGUgInRtcCIgaXMgbm8gbG9uZ2VyIHVzZWQsIEkg
dGhpbmsuCj4KPiBPbmNlIHRoZSAidG1wIiB2YXJpYWJsZSBpcyBkZWxldGVkLCBmZWVsIGZyZWUg
dG8gYWRkIG15IFJldmlld2VkLWJ5LgoKR29vZCBzcG90LiBJJ2xsIGZpeCB0aGF0LgoKCj4gTk9U
RTogcGF0Y2ggIzcgaW4geW91ciBzZXJpZXMgcmUtYWRkcyBhIHVzZXIgb2YgInRtcCIsIGJ1dCBz
aW5jZSB0aGlzCj4gb25lIGlzICJDYzogc3RhYmxlIiB5b3Ugd2lsbCBuZWVkIHRvIGRlbGV0ZSBp
dCBoZXJlIGFuZCB0aGVuIHJlLWFkZCBpdAo+IGluIHBhdGNoICM3Lgo+Cj4KPiA+IGRpZmYgLS1n
aXQgYS9rZXJuZWwvZGVidWcva2RiL2tkYl9pby5jIGIva2VybmVsL2RlYnVnL2tkYi9rZGJfaW8u
Ywo+ID4gaW5kZXggMDZkZmJjY2IxMDMzNi4uYTQyNjA3ZTRkMWFiYSAxMDA2NDQKPiA+IC0tLSBh
L2tlcm5lbC9kZWJ1Zy9rZGIva2RiX2lvLmMKPiA+ICsrKyBiL2tlcm5lbC9kZWJ1Zy9rZGIva2Ri
X2lvLmMKPiA+IEBAIC0xODQsNiArMTg0LDEzIEBAIGNoYXIga2RiX2dldGNoYXIodm9pZCkKPiA+
ICAgICAgICAgdW5yZWFjaGFibGUoKTsKPiA+ICB9Cj4gPgo+ID4gK3N0YXRpYyB2b2lkIGtkYl9w
b3NpdGlvbl9jdXJzb3IoY2hhciAqcHJvbXB0LCBjaGFyICpidWZmZXIsIGNoYXIgKmNwKQo+ID4g
K3sKPiA+ICsgICAgICAga2RiX3ByaW50ZigiXHIlcyIsIGtkYl9wcm9tcHRfc3RyKTsKPiA+ICsg
ICAgICAgaWYgKGNwID4gYnVmZmVyKQo+ID4gKyAgICAgICAgICAgICAgIGtkYl9wcmludGYoIiUu
KnMiLCAoaW50KShjcCAtIGJ1ZmZlciksIGJ1ZmZlcik7Cj4KPiBuaXQ6IHBlcnNvbmFsbHksIEkn
ZCB0YWtlIHRoZSAiaWYiIHN0YXRlbWVudCBvdXQuIEknbSBuZWFybHkgY2VydGFpbgo+IHRoYXQg
a2RiX3ByaW50ZigpIGNhbiBoYW5kbGUgemVyby1sZW5ndGggZm9yIHRoZSB3aWR0aCBhcmd1bWVu
dCBhbmQKPiAiYnVmZmVyIiBjYW4gbmV2ZXIgYmUgX2FmdGVyXyBjcCAoc28geW91IGNhbid0IGdl
dCBuZWdhdGl2ZSkuCgpUaGUga2VybmVsIHdpbGwgY29ycmVjdGx5IGZvcm1hdCB6ZXJvLXdpZHRo
IGZpZWxkcy4uLiBidXQga2RiX3ByaW50ZigpCndpbGwgYWxzbyBpbmplY3QgdGhlIGVtcHR5IHN0
cmluZyBpbnRvIHRoZSBsb2cgaWYgcnVubmluZyB3aXRoCkxPR0dJTkc9MS4gSXQgaXMgdHJ1ZSB0
aGUgZG1lc2cgb3V0cHV0IHdpdGggTE9HR0lORz0xIGlzIHByZXR0eSBuYXN0eQp3aGVuIGRvaW5n
IGxpbmUgZWRpdGluZyBidXQgSSBzdGlsbCBkaWRuJ3Qgd2FudCB0byBtYWtlIGl0IHdvcnNlIQoK
T2guLi4gYW5kIHdlIGNhbid0IGNvbWJpbmUgaW50byBvbmUgY2FsbCB0byBrZGJfcHJpbnRmKCkg
c2luY2UgdGhhdApyZW5kZXJzIGludG8gYSBmaXhlZCBsZW5ndGggc3RhdGljIGJ1ZmZlciBhbmQg
d2UgY291bGQgZ2V0IHVud2FudGVkCnRydW5jYXRpb24uIEkgbWlnaHQganVzdCBhZGQgYSBjb21t
ZW50IGFib3V0IHRoYXQuCgoKRGFuaWVsLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3Jl
cG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
