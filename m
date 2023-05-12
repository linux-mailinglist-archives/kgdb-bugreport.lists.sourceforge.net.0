Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 023BC700A3E
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 12 May 2023 16:24:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pxTh3-0001Tf-QH
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 12 May 2023 14:24:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1pxTh1-0001TZ-BG
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 12 May 2023 14:24:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KlqtYj2sIx0sjwwCMtZ7w/k64brEWXitqz4tOF+SKWQ=; b=lF6vGT4boHjqyRiL7MdeUYUvNm
 s5GzQJwS1jtaYB+w2w0Id1Umg3qET/raXgBC2trkXLy2uuVnxwP5SyCyB7XgRsYj2Vcq/e3mTZav8
 tX+v1SIr+EAtT0N/czslaSEgvZYZuD4tbbfWQECcaKgvEMQQhCjaY5VYgBHH9djo+Z+Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KlqtYj2sIx0sjwwCMtZ7w/k64brEWXitqz4tOF+SKWQ=; b=KlnS8NF07zdVQSIgZu+rtBURKA
 Nv2NZzv7ZR8RhCzR9QS9DPwCOG+oyKSKheTeJ4jh1tHw953CcZTDFtBSGYEPLK782mlsNWj9kjxjT
 s3Ed2wYHhjBy5lgAfsR9au+J/RPBvjDfr+CDNJd7uEx3MNh2f8XkOpxIyZ/kabJuA4FU=;
Received: from mail-lj1-f175.google.com ([209.85.208.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pxTgv-0007h0-DU for kgdb-bugreport@lists.sourceforge.net;
 Fri, 12 May 2023 14:24:22 +0000
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ac8d9399d5so91045301fa.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 12 May 2023 07:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683901451; x=1686493451;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KlqtYj2sIx0sjwwCMtZ7w/k64brEWXitqz4tOF+SKWQ=;
 b=iiBoAP819ejlJ4Z8jSJCSTDIEKk6QOU/ATSYXgmv5pNh1xpAOPNa0OEddZI/tGodcS
 Htpe7XiF8jxxQE5/Iqw5mSP3Q4ELwf9qFy/iVk6Q7wdT2bESviTd9KUdykDhaeAwHDLC
 dM1KXSA5rRDl23ahXavIRl7k7NDwROj1hlgUCDGAM++hUE0psC0EqclwvKrVGOgSnQnr
 kW+uryaEw0o/GBUEsNzChhXKHtEnF+8QE2pGrD6BpI4RcdKZXCBTDK9hgOtAZhhtnJDT
 CiqftUxL61Sou/+aAeszWpF5mQHmsc6grR/fIIQILZL41QO4Gr6qXgnXQIX+OutMJHVy
 tC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683901451; x=1686493451;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KlqtYj2sIx0sjwwCMtZ7w/k64brEWXitqz4tOF+SKWQ=;
 b=KNgkZk8kFlx5X7KavxJU6O9C39t5qHtlMik1F3FpE6oBS6zXAwbQMO2/ybA7b3g/+e
 upiVVXpVmC+2hj7lnBq5nnDx5btUxAPPaBVrVuk2/dUPkpoLt1k5vgsboscZOhI5jFz7
 YCeUlc1N3RSfw7EmFgHN1KKN3in6BFKNI7dIBSuulDeVFidZaYcn29rO5UlyfBwtDCHi
 77I2/COEclX+yYT+RiMyBH9b+NkA9/1sRYZTxxDEAGWxfyS/OWrM5MEuQMfszfNJxdiU
 CrrEo5Uhhwp6PFTyvzSFOhjroezKj7BSfKKVet2cxwBrVJdxFGFU3wIuzICt5Ru8rFE+
 majA==
X-Gm-Message-State: AC+VfDz2VTTBXPU5v9y9PoXpSkTFuWEanHdP9WMGdhm/bmV7Q3b/Q9ju
 VbX53U4r+/9l1vFAOtUsuvhg28IxNU3+UqnywmSuGpQi
X-Google-Smtp-Source: ACHHUZ5gks0kesTcYHQGZmDMSB53C9RWSGJ2R9t+vGgAq1ZD4zyk0Htxw3eMp2IcxpNoLZT/HXSQMA==
X-Received: by 2002:a5d:6246:0:b0:2f6:25a6:9788 with SMTP id
 m6-20020a5d6246000000b002f625a69788mr16443692wrv.35.1683899548461; 
 Fri, 12 May 2023 06:52:28 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 i11-20020adff30b000000b0030644bdefd8sm23519775wro.52.2023.05.12.06.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 06:52:27 -0700 (PDT)
Date: Fri, 12 May 2023 14:52:25 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20230512135225.GA217187@aspen.lan>
References: <20230419225604.21204-1-dianders@chromium.org>
 <20230419155341.v8.8.Ia3aeac89bb6751b682237e76e5ba594318e4b1aa@changeid>
 <CAD=FV=X=tm_smsi9itwK_Ku2vU0d676JT+MK3fkALn5QMsduiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=X=tm_smsi9itwK_Ku2vU0d676JT+MK3fkALn5QMsduiQ@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, May 11, 2023 at 07:34:30AM -0700, Doug Anderson wrote:
    > Hi, > > On Wed, Apr 19, 2023 at 3:57 PM Douglas Anderson <dianders@chromium.org>
    wrote: > > > > To save architectures from needing to [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.175 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.175 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pxTgv-0007h0-DU
Subject: Re: [Kgdb-bugreport] [PATCH v8 08/10] kgdb: Provide a stub
 kgdb_nmicallback() if !CONFIG_KGDB
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jason Wessel <jason.wessel@windriver.com>, ito-yuichi@fujitsu.com,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Marc Zyngier <maz@kernel.org>, kgdb-bugreport@lists.sourceforge.net,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gVGh1LCBNYXkgMTEsIDIwMjMgYXQgMDc6MzQ6MzBBTSAtMDcwMCwgRG91ZyBBbmRlcnNvbiB3
cm90ZToKPiBIaSwKPgo+IE9uIFdlZCwgQXByIDE5LCAyMDIzIGF0IDM6NTfigK9QTSBEb3VnbGFz
IEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4KPiA+IFRvIHNhdmUg
YXJjaGl0ZWN0dXJlcyBmcm9tIG5lZWRpbmcgdG8gd3JhcCB0aGUgY2FsbCBpbiAjaWZkZWZzLCBh
ZGQgYQo+ID4gc3R1YiBuby1vcCB2ZXJzaW9uIG9mIGtnZGJfbm1pY2FsbGJhY2soKSwgd2hpY2gg
cmV0dXJucyAxIGlmIGl0IGRpZG4ndAo+ID4gaGFuZGxlIGFueXRoaW5nLgo+ID4KPiA+IFNpZ25l
ZC1vZmYtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KPiA+IC0t
LQo+ID4KPiA+IENoYW5nZXMgaW4gdjg6Cj4gPiAtICJQcm92aWRlIGEgc3R1YiBrZ2RiX25taWNh
bGxiYWNrKCkgaWYgIUNPTkZJR19LR0RCIiBuZXcgZm9yIHY4Cj4gPgo+ID4gIGluY2x1ZGUvbGlu
dXgva2dkYi5oIHwgMSArCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgva2dkYi5oIGIvaW5jbHVkZS9saW51eC9rZ2Ri
LmgKPiA+IGluZGV4IDg3NzEzYmQzOTBmMy4uOWNlNjI4ZWU0N2NjIDEwMDY0NAo+ID4gLS0tIGEv
aW5jbHVkZS9saW51eC9rZ2RiLmgKPiA+ICsrKyBiL2luY2x1ZGUvbGludXgva2dkYi5oCj4gPiBA
QCAtMzc3LDUgKzM3Nyw2IEBAIGV4dGVybiB2b2lkIGtnZGJfZnJlZV9pbml0X21lbSh2b2lkKTsK
PiA+ICAjZGVmaW5lIGRiZ19sYXRlX2luaXQoKQo+ID4gIHN0YXRpYyBpbmxpbmUgdm9pZCBrZ2Ri
X3BhbmljKGNvbnN0IGNoYXIgKm1zZykge30KPiA+ICBzdGF0aWMgaW5saW5lIHZvaWQga2dkYl9m
cmVlX2luaXRfbWVtKHZvaWQpIHsgfQo+ID4gK3N0YXRpYyBpbnQga2dkYl9ubWljYWxsYmFjayhp
bnQgY3B1LCB2b2lkICpyZWdzKSB7IHJldHVybiAxOyB9Cj4KPiBGV0lXOiBJIGp1c3QgcmVhbGl6
ZWQgdGhhdCB0aGUgYWJvdmUgbmVlZHMgYW4gImlubGluZSIgdG8gbWFrZSB0aGUKPiBjb21waWxl
ciBub3QgY29tcGxhaW4uIEknbSBzdGlsbCBob3BpbmcgZm9yIG1vcmUgZmVlZGJhY2sgb24gdGhl
Cj4gc2VyaWVzLCBidXQgSSdsbCBwbGFuIHRvIGZpeCB0aGF0IGluIHRoZSBuZXh0IHNwaW4uCgpP
biB0aGUgbmV4dCBzcGluIGZlZWwgZnJlZSB0byBhZGQ6ClJldmlld2VkLWJ5OiBEYW5pZWwgVGhv
bXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgoKCkRhbmllbC4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWls
aW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
