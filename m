Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9114670414F
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 16 May 2023 01:12:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pyhMf-0000xw-TR
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 15 May 2023 23:12:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1pyhMe-0000xp-Pp
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 15 May 2023 23:12:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lqtkImGxR85aToYA0Aq0yuOc2duxdpDWQf3A/P/lpm0=; b=ZT7XByDm4ToyO1rz43yUsmJ0fQ
 0trLS4vw9P+9qpvsuMHBfXzHmlWy7iUEssN/sXD4prDT4uW0pefDwB49Wd+UWJFaeflmM2REChDSp
 2eWDFSw9wRf377+usd8yyfte2ltgleE1ZvTxhpMzwjAuNxjMiPy1nhdeJ9Zi92s2//y8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lqtkImGxR85aToYA0Aq0yuOc2duxdpDWQf3A/P/lpm0=; b=ZpHVAipPHhTbHmtOofUfESx5hZ
 jPJ2QYzg/gkE0QbrhTlVWALFD5/uu6RumT+1AJ9Ogc2QFDFpyj1Pvz4JzxVDWq4Qu7J2uIDwjyBHz
 Igs/Ejs0pATbekl05URBp3mlEEeXCtRFAdnROXQ2fml3xdUMa7/KHbbmEIysqx9NfW8s=;
Received: from mail-qt1-f178.google.com ([209.85.160.178])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pyhMa-008tXA-Vr for kgdb-bugreport@lists.sourceforge.net;
 Mon, 15 May 2023 23:12:24 +0000
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-3f4fc2a4622so22137901cf.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 15 May 2023 16:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684192334; x=1686784334;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lqtkImGxR85aToYA0Aq0yuOc2duxdpDWQf3A/P/lpm0=;
 b=i6s9RcCbVFvIxf2SkdJIo5ItZP5xS91iEAq6AvljV+l004i61Ow7E/6xjUCLoOzf5n
 btMzGjYcL1Xc1V4XzI1LMM7ztpWpDAtS0sLbMmE411lZTTTRaPpphC5ywXxvuEt1rVlU
 you7r1mkL/Qy3UuiYDu7XN7odtPkmkPh6q2uo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684192334; x=1686784334;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lqtkImGxR85aToYA0Aq0yuOc2duxdpDWQf3A/P/lpm0=;
 b=NARdFxAjB3gi67ZxQ2+WN+o6NtNIIdSpsWUoZ/06zwS/AMsT/DwrR64qbRyXEx45pB
 yDXJIF46M/9szN136Rd1+F14AMwnXtmlrNm00EyEc6Onq4Q6IlkxkLAnJ5ajfsY2ypKc
 RKCpxJzOLF445JUPtnK1G1R6MELFnzHWgMcoio5ViUh7t/hLwAWUBoi/M2VXj79cnQTa
 BhmSFoLPK+4HxvgrToXCTSkaF/AMGkdnxv6Hu/j767bW8buXyjTzFNtU5uUshfbvzc8r
 VeV5/Uml7dY3vlcZhN8WRCjl2p1f9TZr7nqsYiwsKkVDMlQvSWXjcNQGJ0BxV1OfQcIJ
 24IA==
X-Gm-Message-State: AC+VfDwVgZUSONzIKC/59V5B2MOhoPUGb+FHDhJCs5SMAf2XEdI5Kxdh
 An2ASODDSUIrWZ3v0BzmIiBO7tUDd4K4/GmnqfM=
X-Google-Smtp-Source: ACHHUZ6vtdwPpStToRdjLWD+EjpZ2kpcGkJVUblIX36hcmq7ndKeFa+WozQ76CigSPjcLnH7JjxeCQ==
X-Received: by 2002:a05:622a:105:b0:3ed:a2f5:f27c with SMTP id
 u5-20020a05622a010500b003eda2f5f27cmr53869448qtw.12.1684192334590; 
 Mon, 15 May 2023 16:12:14 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com.
 [209.85.160.175]) by smtp.gmail.com with ESMTPSA id
 r9-20020ac83b49000000b003e394714c07sm5740386qtf.10.2023.05.15.16.12.08
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 16:12:11 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-3f38a9918d1so1589321cf.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 15 May 2023 16:12:08 -0700 (PDT)
X-Received: by 2002:ac8:5c48:0:b0:3f3:8b28:f0b4 with SMTP id
 j8-20020ac85c48000000b003f38b28f0b4mr67302qtj.18.1684192327980; Mon, 15 May
 2023 16:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230419225604.21204-1-dianders@chromium.org>
 <20230419155341.v8.9.I2ef26d1b3bfbed2d10a281942b0da7d9854de05e@changeid>
 <20230512140051.GA217273@aspen.lan>
In-Reply-To: <20230512140051.GA217273@aspen.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 15 May 2023 16:11:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UPy5kA7mJteY+YzHa2ExvBKHvxR9SnM=qxxKwXbTNHkw@mail.gmail.com>
Message-ID: <CAD=FV=UPy5kA7mJteY+YzHa2ExvBKHvxR9SnM=qxxKwXbTNHkw@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Fri, May 12, 2023 at 7:00 AM Daniel Thompson <daniel.thompson@linaro.org>
    wrote: > > On Wed, Apr 19, 2023 at 03:56:03PM -0700, Douglas Anderson wrote:
    > > From: Sumit Garg <sumit.garg@linaro.org> [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.160.178 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.160.178 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pyhMa-008tXA-Vr
Subject: Re: [Kgdb-bugreport] [PATCH v8 09/10] arm64: kgdb: Roundup cpus
 using IPI as NMI
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
 Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, ito-yuichi@fujitsu.com,
 Alexandru Elisei <alexandru.elisei@arm.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, linux-perf-users@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Marc Zyngier <maz@kernel.org>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBGcmksIE1heSAxMiwgMjAyMyBhdCA3OjAw4oCvQU0gRGFuaWVsIFRob21wc29uCjxk
YW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIEFwciAxOSwgMjAy
MyBhdCAwMzo1NjowM1BNIC0wNzAwLCBEb3VnbGFzIEFuZGVyc29uIHdyb3RlOgo+ID4gRnJvbTog
U3VtaXQgR2FyZyA8c3VtaXQuZ2FyZ0BsaW5hcm8ub3JnPgo+ID4KPiA+IGFybTY0IHBsYXRmb3Jt
cyB3aXRoIEdJQ3YzIG9yIGxhdGVyIHN1cHBvcnRzIHBzZXVkbyBOTUlzIHdoaWNoIGNhbiBiZQo+
ID4gbGV2ZXJhZ2VkIHRvIHJvdW5kdXAgQ1BVcyB3aGljaCBhcmUgc3R1Y2sgaW4gaGFyZCBsb2Nr
dXAgc3RhdGUgd2l0aAo+ID4gaW50ZXJydXB0cyBkaXNhYmxlZCB0aGF0IHdvdWxkbid0IGJlIHBv
c3NpYmxlIHdpdGggYSBub3JtYWwgSVBJLgo+ID4KPiA+IFNvIGluc3RlYWQgc3dpdGNoIHRvIHJv
dW5kdXAgQ1BVcyB1c2luZyBJUEkgdHVybmVkIGFzIE5NSS4gQW5kIGluCj4gPiBjYXNlIGEgcGFy
dGljdWxhciBhcm02NCBwbGF0Zm9ybSBkb2Vzbid0IHN1cHBvcnRzIHBzZXVkbyBOTUlzLAo+ID4g
aXQgd2lsbCBzd2l0Y2ggYmFjayB0byBkZWZhdWx0IGtnZGIgQ1BVcyByb3VuZHVwIG1lY2hhbmlz
bS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBTdW1pdCBHYXJnIDxzdW1pdC5nYXJnQGxpbmFyby5v
cmc+Cj4gPiBUZXN0ZWQtYnk6IENoZW4tWXUgVHNhaSA8d2Vuc0Bjc2llLm9yZz4KPiA+IFNpZ25l
ZC1vZmYtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KPiA+IC0t
LQo+ID4KPiA+IChubyBjaGFuZ2VzIHNpbmNlIHYxKQo+ID4KPiA+ICBhcmNoL2FybTY0L2tlcm5l
bC9pcGlfbm1pLmMgfCAgNSArKysrKwo+ID4gIGFyY2gvYXJtNjQva2VybmVsL2tnZGIuYyAgICB8
IDE4ICsrKysrKysrKysrKysrKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9u
cygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2tlcm5lbC9pcGlfbm1pLmMgYi9h
cmNoL2FybTY0L2tlcm5lbC9pcGlfbm1pLmMKPiA+IGluZGV4IGM1OTJlOTJiOGNiZi4uMmFkYWFm
MTUxOWU1IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9hcm02NC9rZXJuZWwvaXBpX25taS5jCj4gPiAr
KysgYi9hcmNoL2FybTY0L2tlcm5lbC9pcGlfbm1pLmMKPiA+IEBAIC04LDYgKzgsNyBAQAo+ID4K
PiA+ICAjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L2ly
cS5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9rZ2RiLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L25t
aS5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9zbXAuaD4KPiA+Cj4gPiBAQCAtNDUsMTAgKzQ2LDE0
IEBAIGJvb2wgYXJjaF90cmlnZ2VyX2NwdW1hc2tfYmFja3RyYWNlKGNvbnN0IGNwdW1hc2tfdCAq
bWFzaywgYm9vbCBleGNsdWRlX3NlbGYpCj4gPiAgc3RhdGljIGlycXJldHVybl90IGlwaV9ubWlf
aGFuZGxlcihpbnQgaXJxLCB2b2lkICpkYXRhKQo+ID4gIHsKPiA+ICAgICAgIGlycXJldHVybl90
IHJldCA9IElSUV9OT05FOwo+ID4gKyAgICAgdW5zaWduZWQgaW50IGNwdSA9IHNtcF9wcm9jZXNz
b3JfaWQoKTsKPgo+IERvZXMgdGhpcyBwbGF5IG5pY2Ugd2l0aCBDT05GSUdfREVCVUdfUFJFRU1Q
VD8gSSBtYXkgaGF2ZSBtaXNzZWQKPiBzb21ldGhpbmcgYWJvdXQgdGhlIE5NSSBlbnRyeSBidXQg
YSBxdWljayBzY2FuIG9mIHRoZSBhcm02NAo+IGFyY2hfaXJxX2Rpc2FibGVkKCkgc3VnZ2VzdHMg
dGhhdCBkZWJ1Z19zbXBfcHJvY2Vzc29yX2lkKCkgd2lsbCBpc3N1ZQo+IHdhcm5pbmdzIGF0IHRo
aXMgcG9pbnQuLi4KPgo+IE90aGVyIHRoYW4gSSBkaWRuJ3Qgc2VlIGFueXRoaW5nIEkgZG9uJ3Qg
bGlrZSBoZXJlLgoKR29vZCBxdWVzdGlvbi4gSXQgc2VlbXMgdG8sIGF0IGxlYXN0IG9uIHRoZSBz
YzcxODAtdHJvZ2Rvci1iYXNlZApzeXN0ZW0gSSB0ZXN0ZWQuCgpKdXN0IHRvIGNvbmZpcm0sIEkg
cHJpbnRlZCBvdXQgdGhlIHZhbHVlcyBvZiBzb21lIG9mIHRoZSBzdHVmZiB0aGF0J3MKY2hlY2tl
ZC4gV2hlbiB0aGlzIGZ1bmN0aW9uIHdhcyBjYWxsZWQsIEkgc2F3OgoKaXJxc19kaXNhYmxlZCgp
ID0+IHRydWUKcmF3X2xvY2FsX3NhdmVfZmxhZ3MoKSA9PiAweDAwMDAwMGYwCl9faXJxZmxhZ3Nf
dXNlc19wbXIoKSA9PiAxCgpUaGUgIl9faXJxZmxhZ3NfdXNlc19wbXIiIGlzIHRoZSB0aGluZyB0
aGF0IGdldHMgc2V0IHdoZW4gd2UgdHJ5IHRvCmVuYWJsZSBwc2V1ZG8tTk1JcyBhbmQgdGhleSdy
ZSBhY3R1YWxseSB0aGVyZS4gVGhhdCBjYXVzZXMgdXMgdG8gY2FsbApfX3Btcl9pcnFzX2Rpc2Fi
bGVkX2ZsYWdzKCkgd2hpY2ggd2lsbCBjb21wYXJlIHRoZSBmbGFncyAoMHhmMCkgdG8KR0lDX1BS
SU9fSVJRT04gKDB4ZTApLiBJZiBmbGFncyBpcyBub3QgdGhlIHNhbWUgYXMgR0lDX1BSSU9fSVJR
T04gdGhlbgppbnRlcnJ1cHRzIGFyZSBkaXNhYmxlZC4KCi4uLnNvLCBhc3N1bWluZyBJIHVuZGVy
c3Rvb2QgZXZlcnl0aGluZywgSSB0aGluayB3ZSdyZSBPSy4KCkkgYWxzbyB0cmllZCB0byBzZWUg
d2hhdCBoYXBwZW5lZCB3aXRoIHRoZSB3aG9sZSAiZmFsbGJhY2sgdG8gdXNlCnJlZ3VsYXIgSVBJ
cyBpZiB3ZSBkb24ndCBoYXZlIHBzZXVkby1OTUlzIGVuYWJsZWQiIChBS0EgcGF0Y2ggIzEwIGlu
CnRoaXMgc2VyaWVzKS4gSW4gdGhhdCBjYXNlLCBJIGhhZDoKCmlycXNfZGlzYWJsZWQoKSA9PiB0
cnVlCnJhd19sb2NhbF9zYXZlX2ZsYWdzKCkgPT4gMHgwMDAwMDBjMApfX2lycWZsYWdzX3VzZXNf
cG1yKCkgPT4gMAoKLi4uaW4gdGhpcyBjYXNlIHdlIGVuZCB1cCBpbiBfX2RhaWZfaXJxc19kaXNh
YmxlZF9mbGFncygpLiBUaGF0IGNoZWNrcwp0byBzZWUgaWYgdGhlIGZsYWdzICgweGMwKSBoYXMg
dGhlICJJIGJpdCIgKDB4ODApIHNldC4gSXQgaXMgc2V0LCBzbwppbnRlcnJ1cHRzIGFyZSBkaXNh
YmxlZC4KCi1Eb3VnCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9rZ2RiLWJ1Z3JlcG9ydAo=
