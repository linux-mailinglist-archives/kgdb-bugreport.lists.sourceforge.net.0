Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE0C7CAC29
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 16 Oct 2023 16:50:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qsOvO-00035a-6z
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 16 Oct 2023 14:50:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1qsOvM-00035U-MS
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 16 Oct 2023 14:50:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eDGQeCo8V2sN0t+O9GNO1jubu9jMmcOIokTbMoAoZDo=; b=dmPWXkHp0gcvO7rHI9EEiqXXzh
 Uu8iEGsJH9Dzt2/0NdFrbRAXxPrdlyaO3LwvuSdNohj6wZf2piiM/+WbLk8lGp5hIp7MrHjp6cpMv
 R6UM1VGFg+mrtQz14PzHC5S+tYcWntBay5HQF5z+6IvBQvN0352U11ePYrdukQKPuiFg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eDGQeCo8V2sN0t+O9GNO1jubu9jMmcOIokTbMoAoZDo=; b=aRBvuR/5os4iYrgxP6llgUsEu1
 NJV6YwvrLrue2WjgE4z1BDU1jT+zYTa3EEBsSwL/fTAv2VQ4CNcQvJvwz482dQY3BsJaHxy5S5IOL
 Q/BewnyfHZsQyNJ1oWkXLY+s90I39bPteIV38q0UKCn7qGiXq045K5jWRGrCsM4+zweI=;
Received: from mail-lj1-f174.google.com ([209.85.208.174])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qsOvJ-00GgxM-Ao for kgdb-bugreport@lists.sourceforge.net;
 Mon, 16 Oct 2023 14:50:27 +0000
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2c5087d19a6so38704391fa.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 16 Oct 2023 07:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697467818; x=1698072618; darn=lists.sourceforge.net;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eDGQeCo8V2sN0t+O9GNO1jubu9jMmcOIokTbMoAoZDo=;
 b=IhdldTg3uNGVD1iWQwkMkwbCO952ewdcmRYjEWzvrKnYrYjzOqr4ycSVCHai6G+Uh+
 e9cfno3zJ/Ez9H5krNYBa7rSzy7ge/VBhlRQztKR1WcdjcuiEu72im3d8wVm96aYI6nA
 etxQIrRyf9pZgPMwH5tVx1v9r05ZMZswc6IsAvtFGIIzpwaRir5Y0LVkjz5JXLZYLZKy
 JlPhC1+8UZ5iWyjeBoA9fJBio/eT8i0y5a90FlaFL1Gfn5q6/VKgyI+cWxwd27BH3ya9
 SMTaAGLbbmvqLjkZNgZ7dl/5Dx72kykRqMDIvSViwDnOIwfewGTQRBf+++ePT/L9h4I1
 wVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697467818; x=1698072618;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eDGQeCo8V2sN0t+O9GNO1jubu9jMmcOIokTbMoAoZDo=;
 b=QYDFsal0VYyGiBL207DIea1LFmZv184Q1bZ1xAqhgdB11DhRxL2hPzDcRUruOP3G0h
 OQz/582cI9KF7MYNPM8f+OKoIOaLHKQPyLOD/qVP8wa8SiFojEn4ABanF70aUQ2FoIDN
 XIUZivzPKTjGMPdD99tICzzEQl1UXNWZIgSoLtp8K+B32lFQJUPDfioxkkeMn2amKRSu
 zcYaI44VcsKETPMgKhE+B5GookkIcs8BR9fFQ4Lt7+MjER2XDlTGAvh+mGzqTBbXQQqf
 7Lx04r41GJBWAALy5kegUlEiHjzGn/vOwF2NqPenkxe6X5RhVsXTiwWug8ZszvxYHtY6
 /HzQ==
X-Gm-Message-State: AOJu0Yz/nMy6rnVAc67SYCLWNkeG0lJXkGZ/6JLAbbloJ9dwrbYJvDTA
 0Y4eYcVAGdDZdT8Q5iYVgfiANil5w+e+vDCdUhPyKg==
X-Google-Smtp-Source: AGHT+IGJQJysehFTxAPwxBpw5JMtYiRjxXlCiE0L8eX1v9Nl7lopYTAwJFcz4ASvEhzaP4YRec0IoQ==
X-Received: by 2002:a5d:5f04:0:b0:32d:8872:aacb with SMTP id
 cl4-20020a5d5f04000000b0032d8872aacbmr13881089wrb.53.1697464820459; 
 Mon, 16 Oct 2023 07:00:20 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 bw14-20020a0560001f8e00b0032d886039easm13152255wrb.14.2023.10.16.07.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 07:00:20 -0700 (PDT)
Date: Mon, 16 Oct 2023 15:00:18 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Petr Mladek <pmladek@suse.com>
Message-ID: <20231016140018.GA35190@aspen.lan>
References: <20230822131945.1.I5b460ae8f954e4c4f628a373d6e74713c06dd26f@changeid>
 <20230825100854.GC270740@aspen.lan>
 <CAD=FV=VHa1arysMgqZcGFGFi2N8i0BeKWD6BM8dSsg0Xq2LUFQ@mail.gmail.com>
 <20230830095359.GA44243@aspen.lan> <ZQrfGho-M9ZHQe9F@alley>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZQrfGho-M9ZHQe9F@alley>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Sep 20, 2023 at 02:01:30PM +0200, Petr Mladek wrote:
 > On Wed 2023-08-30 10:53:59, Daniel Thompson wrote: > > On Fri, Aug 25,
 2023 at 07:18:44AM -0700, Doug Anderson wrote: > > > Hi, > > > > > [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.174 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.174 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qsOvJ-00GgxM-Ao
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: Flush console before entering
 kgdb on panic
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
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gV2VkLCBTZXAgMjAsIDIwMjMgYXQgMDI6MDE6MzBQTSArMDIwMCwgUGV0ciBNbGFkZWsgd3Jv
dGU6Cj4gT24gV2VkIDIwMjMtMDgtMzAgMTA6NTM6NTksIERhbmllbCBUaG9tcHNvbiB3cm90ZToK
PiA+IE9uIEZyaSwgQXVnIDI1LCAyMDIzIGF0IDA3OjE4OjQ0QU0gLTA3MDAsIERvdWcgQW5kZXJz
b24gd3JvdGU6Cj4gPiA+IEhpLAo+ID4gPgo+ID4gPiBPbiBGcmksIEF1ZyAyNSwgMjAyMyBhdCAz
OjA54oCvQU0gRGFuaWVsIFRob21wc29uCj4gPiA+IDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9y
Zz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBUdWUsIEF1ZyAyMiwgMjAyMyBhdCAwMToxOTo0
NlBNIC0wNzAwLCBEb3VnbGFzIEFuZGVyc29uIHdyb3RlOgo+ID4gPiA+ID4gV2hlbiBlbnRlcmlu
ZyBrZGIva2dkYiBvbiBhIGtlcm5lbCBwYW5pYywgaXQgd2FzIGJlIG9ic2VydmVkIHRoYXQgdGhl
Cj4gPiA+ID4gPiBjb25zb2xlIGlzbid0IGZsdXNoZWQgYmVmb3JlIHRoZSBga2RiYCBwcm9tcHQg
Y2FtZSB1cC4gU3BlY2lmaWNhbGx5LAo+ID4gPiA+ID4gd2hlbiB1c2luZyB0aGUgYnVkZHkgbG9j
a3VwIGRldGVjdG9yIG9uIGFybTY0IGFuZCBydW5uaW5nOgo+ID4gPiA+ID4gICBlY2hvIEhBUkRM
T0NLVVAgPiAvc3lzL2tlcm5lbC9kZWJ1Zy9wcm92b2tlLWNyYXNoL0RJUkVDVAo+ID4gPiA+ID4K
PiA+ID4gPiA+IEkgY291bGQgc2VlOgo+ID4gPiA+ID4gICBbICAgMjYuMTYxMDk5XSBsa2R0bTog
UGVyZm9ybWluZyBkaXJlY3QgZW50cnkgSEFSRExPQ0tVUAo+ID4gPiA+ID4gICBbICAgMzIuNDk5
ODgxXSB3YXRjaGRvZzogV2F0Y2hkb2cgZGV0ZWN0ZWQgaGFyZCBMT0NLVVAgb24gY3B1IDYKPiA+
ID4gPiA+ICAgWyAgIDMyLjU1Mjg2NV0gU2VuZGluZyBOTUkgZnJvbSBDUFUgNSB0byBDUFVzIDY6
Cj4gPiA+ID4gPiAgIFsgICAzMi41NTczNTldIE5NSSBiYWNrdHJhY2UgZm9yIGNwdSA2Cj4gPiA+
ID4gPiAgIC4uLiBbYmFja3RyYWNlIGZvciBjcHUgNl0gLi4uCj4gPiA+ID4gPiAgIFsgICAzMi41
NTgzNTNdIE5NSSBiYWNrdHJhY2UgZm9yIGNwdSA1Cj4gPiA+ID4gPiAgIC4uLiBbYmFja3RyYWNl
IGZvciBjcHUgNV0gLi4uCj4gPiA+ID4gPiAgIFsgICAzMi44Njc0NzFdIFNlbmRpbmcgTk1JIGZy
b20gQ1BVIDUgdG8gQ1BVcyAwLTQsNzoKPiA+ID4gPiA+ICAgWyAgIDMyLjg3MjMyMV0gTk1JIGJh
Y2t0cmFjZSBmb3JQIGNwdUFOQzogSGFyZCBMT0NLVVAKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgIEVu
dGVyaW5nIGtkYiAoY3VycmVudD0uLi4sIHBpZCAwKSBvbiBwcm9jZXNzb3IgNSBkdWUgdG8gS2V5
Ym9hcmQgRW50cnkKPiA+ID4gPiA+ICAgWzVda2RiPgo+ID4gPiA+ID4KPiA+ID4gPiA+IEFzIHlv
dSBjYW4gc2VlLCBiYWNrdHJhY2VzIGZvciB0aGUgb3RoZXIgQ1BVcyBzdGFydCBwcmludGluZyBh
bmQgZ2V0Cj4gPiA+ID4gPiBpbnRlcmxlYXZlZCB3aXRoIHRoZSBrZGIgUEFOSUMgcHJpbnQuCj4g
PiA+ID4gPgo+ID4gPiA+ID4gTGV0J3MgcmVwbGljYXRlIHRoZSBjb21tYW5kcyB0byBmbHVzaCB0
aGUgY29uc29sZSBpbiB0aGUga2RiIHBhbmljCj4gPiA+ID4gPiBlbnRyeSBwb2ludCB0byBhdm9p
ZCB0aGlzLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IERvdWdsYXMgQW5kZXJz
b24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4KPiA+ID4g
PiA+ICBrZXJuZWwvZGVidWcvZGVidWdfY29yZS5jIHwgMyArKysKPiA+ID4gPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gPiA+ID4gPgo+ID4gPiA+ID4gZGlmZiAtLWdpdCBh
L2tlcm5lbC9kZWJ1Zy9kZWJ1Z19jb3JlLmMgYi9rZXJuZWwvZGVidWcvZGVidWdfY29yZS5jCj4g
PiA+ID4gPiBpbmRleCBkNWU5Y2NkZTNhYjguLjNhOTA0ZDg2OTdjOCAxMDA2NDQKPiA+ID4gPiA+
IC0tLSBhL2tlcm5lbC9kZWJ1Zy9kZWJ1Z19jb3JlLmMKPiA+ID4gPiA+ICsrKyBiL2tlcm5lbC9k
ZWJ1Zy9kZWJ1Z19jb3JlLmMKPiA+ID4gPiA+IEBAIC0xMDA2LDYgKzEwMDYsOSBAQCB2b2lkIGtn
ZGJfcGFuaWMoY29uc3QgY2hhciAqbXNnKQo+ID4gPiA+ID4gICAgICAgaWYgKHBhbmljX3RpbWVv
dXQpCj4gPiA+ID4gPiAgICAgICAgICAgICAgIHJldHVybjsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAr
ICAgICBkZWJ1Z19sb2Nrc19vZmYoKTsKPiA+ID4gPiA+ICsgICAgIGNvbnNvbGVfZmx1c2hfb25f
cGFuaWMoQ09OU09MRV9GTFVTSF9QRU5ESU5HKTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICAgICAg
IGlmIChkYmdfa2RiX21vZGUpCj4gPiA+ID4gPiAgICAgICAgICAgICAgIGtkYl9wcmludGYoIlBB
TklDOiAlc1xuIiwgbXNnKTsKPiA+ID4gPgo+ID4gPiA+IEknbSBzb21ld2hhdCBpbmNsdWRlZCB0
byBzYXkgKnRoaXMqIChjYWxsaW5nIGtkYl9wcmludGYoKSB3aGVuIG5vdAo+ID4gPiA+IGFjdHVh
bGx5IGluIHRoZSBkZWJ1Z2dlcikgaXMgdGhlIGNhdXNlIG9mIHRoZSBwcm9ibGVtLiBrZGJfcHJp
bnRmKCkKPiA+ID4gPiBkb2VzIHNvbWUgcHJldHR5IGhvcmlkIHRoaW5ncyB0byB0aGUgY29uc29s
ZSBhbmQgaXNuJ3QgaW50ZW5kZWQgdG8KPiA+ID4gPiBydW4gd2hpbGUgdGhlIHN5c3RlbSBpcyBh
Y3RpdmUuCj4gPiA+ID4KPiA+ID4gPiBJJ2QgdGhlcmVmb3JlIGJlIG1vcmUgdGVtcHRlZCB0byBk
ZWZlciB0aGUgcHJpbnQgdG8gdGhlIGIucC4gdHJhcAo+ID4gPiA+IGhhbmRsZXIgaXRzZWxmIGFu
ZCBtYWtlIHRoaXMgcGFydCBvZiBrZ2RiX3BhbmljKCkgbG9vayBtb3JlIGxpa2U6Cj4gPiA+ID4K
PiA+ID4gPiAgICAgICAgIGtnZGJfcGFuaWNfbXNnID0gbXNnOwo+ID4gPiA+ICAgICAgICAga2dk
Yl9icmVha3BvaW50KCk7Cj4gPiA+ID4gICAgICAgICBrZ2RiX3BhbmljX21zZyA9IE5VTEw7Cj4g
PiA+Cj4gPiA+IFVuZm9ydHVuYXRlbHkgSSB0aGluayB0aGF0IG9ubHkgc29sdmVzIGhhbGYgdGhl
IHByb2JsZW0uIEFzIGEgcXVpY2sKPiA+ID4gdGVzdCwgSSB0cmllZCBzaW1wbHkgY29tbWVudGlu
ZyBvdXQgdGhlICJrZGJfcHJpbnRmIiBsaW5lIGluCj4gPiA+IGtnZGJfcGFuaWMoKS4gV2hpbGUg
dGhhdCBhdm9pZHMgdGhlIGludGVybGVhdmVkIHBhbmljIG1lc3NhZ2UgYW5kCj4gPiA+IGJhY2t0
cmFjZSwgaXQgZG9lcyBub3RoaW5nIHRvIGFjdHVhbGx5IGdldCB0aGUgYmFja3RyYWNlcyBwcmlu
dGVkIG91dAo+ID4gPiBiZWZvcmUgeW91IGVuZCB1cCBpbiBrZGIuIEFzIGFuIGV4YW1wbGUsIHRo
aXMgaXMgd2hhdCBoYXBwZW5lZCB3aGVuIEkKPiA+ID4gdXNlZCBgZWNobyBIQVJETE9DS1VQID4g
L3N5cy9rZXJuZWwvZGVidWcvcHJvdm9rZS1jcmFzaC9ESVJFQ1RgIGFuZAo+ID4gPiBoYWQgdGhl
ICJrZGJfcHJpbnRmIiBpbiBrZ2RiX3BhbmljKCkgY29tbWVudGVkIG91dDoKPiA+ID4KPiA+ID4g
WyAgIDcyLjY1ODQyNF0gbGtkdG06IFBlcmZvcm1pbmcgZGlyZWN0IGVudHJ5IEhBUkRMT0NLVVAK
PiA+ID4gWyAgIDgyLjE4MTg1N10gd2F0Y2hkb2c6IFdhdGNoZG9nIGRldGVjdGVkIGhhcmQgTE9D
S1VQIG9uIGNwdSA2Cj4gPiA+IC4uLgo+ID4gPiBbICAgODIuMjM0ODAxXSBTZW5kaW5nIE5NSSBm
cm9tIENQVSA1IHRvIENQVXMgNjoKPiA+ID4gWyAgIDgyLjIzOTI5Nl0gTk1JIGJhY2t0cmFjZSBm
b3IgY3B1IDYKPiA+ID4gLi4uIFsgc3RhY2sgdHJhY2UgZm9yIENQVSA2IF0gLi4uCj4gPiA+IFsg
ICA4Mi4yNDAyOTRdIE5NSSBiYWNrdHJhY2UgZm9yIGNwdSA1Cj4gPiA+IC4uLiBbIHN0YWNrIHRy
YWNlIGZvciBDUFUgNSBdIC4uLgo+ID4gPiBbICAgODIuNTc2NDQzXSBTZW5kaW5nIE5NSSBmcm9t
IENQVSA1IHRvIENQVXMgMC00LDc6Cj4gPiA+IFsgICA4Mi41ODEyOTFdIE5NSSBiYWNrdHJhY2UK
PiA+ID4gRW50ZXJpbmcga2RiIChjdXJyZW50PTB4ZmZmZmZmODBkYTVhMTA4MCwgcGlkIDY5Nzgp
IG9uIHByb2Nlc3NvciA1IGR1ZQo+ID4gPiB0byBLZXlib2FyZCBFbnRyeQo+ID4gPiBbNV1rZGI+
Cj4gPiA+Cj4gPiA+IEFzIHlvdSBjYW4gc2VlLCBJIGRvbid0IHNlZSB0aGUgdHJhY2VzIGZvciBD
UFVzIDAtNCBhbmQgNy4gVGhvc2UgZG8KPiA+ID4gc2hvdyB1cCBpZiBJIHVzZSB0aGUgImRtZXNn
IiBjb21tYW5kIGJ1dCBpdCdzIGEgYml0IG9mIGEgaGFzc2xlIHRvIHJ1bgo+ID4gPiAiZG1lc2ci
IHRvIGxvb2sgZm9yIGFueSBleHRyYSBkZWJ1ZyBtZXNzYWdlcyBldmVyeSB0aW1lIEkgZHJvcCBp
biBrZGIuCj4gPiA+Cj4gPiA+IEkgZ3Vlc3MgcGVyaGFwcyB0aGF0IHBhcnQgaXNuJ3Qgb2J2aW91
cyBmcm9tIHRoZSBjb21taXQgbWVzc2FnZT8KPiA+Cj4gPiBJIGZpZ3VyZWQgaXQgd2FzIGEgcmlz
ay4KPiA+Cj4gPiBJbiBmYWN0IGl0J3MgYW4gYXJlYSB3aGVyZSBteSBpbnN0aW5jdCB0byBob25v
dXIgY29uc29sZSBtZXNzYWdlcyBhbmQgbXkKPiA+IGluc3RpbmN0IHRvIGdldCBpbnRvIHRoZSBr
ZXJuZWwgYXMgc29vbiBhcyBwb3NzaWJsZSBhZnRlciB0aGUgZGVjaXNpb24KPiA+IHRvIGludm9r
ZSBpdCBoYXMgYmVlbiBtYWRlIGNvbWUgaW50byBjb25mbGljdC4KPiA+Cj4gPiBJbiBvdGhlciB3
b3JkcyBkb2VzIGl0IG1hdHRlciB0aGF0IHRoZSBjb25zb2xlIGJ1ZmZlcnMgYXJlIG5vdCBmbHVz
aGVkCj4gPiBiZWZvcmUgZW50ZXJpbmcga2dkYj8gSG93ZXZlciBoYXZpbmcgdGhvdWdodCBhYm91
dCBpdCBmb3IgYSBsaXR0bGUgd2hpbGUKPiA+IChhbmQga25vd2luZyB0aGUgY29uc29sZSBjb2Rl
IHRlbmRzIHRvIGJlIHdyaXR0ZW4gdG8gYmUgZGVjZW50bHkgcm9idXN0KQo+ID4gSSBjYW4gY29t
ZSB0byB0aGUgdmlldyB0aGUgZmx1c2hpbmcgaXMgYmVzdC4KPgo+IEp1c3QgZm9yIHJlY29yZC4g
SSB3b25kZXJlZCBpZiB0aGVyZSB3YXMgYnVnIGluIHByaW50aygpIHRoYXQgdGhlCj4gYmFja3Ry
YWNlcyB3ZXJlIG5vdCBmbHVzaGVkLiBBbmQgSSB0aGluayB0aGF0IGl0IGlzIGJlY2F1c2UgdGhl
eQo+IGFyZSBwcmludGVkIGluIE5NSSBjb250ZXh0IHdoZXJlIHRoZSBjb25vc2xlIGhhbmRsaW5n
IGlzIGRlZmVycmVkLgo+Cj4gRnJvbSB0aGlzIFBPViwgdGhlIGV4cGxpY2l0IGZsdXNoIG1ha2Vz
IHBlcmZlY3Qgc2Vuc2UuCgpBZ3JlZWQuLi4gYW5kICh3aXRoIGFwb2xvZ2llcyBmb3IgdGhlIGxl
bmd0aCBvZiB0aW1lIHRvIGdldCB0aGlzCmRvbmUpOgpBcHBsaWVkIQoKClRoYW5rcwoKRGFuaWVs
LgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGIt
YnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdy
ZXBvcnQK
