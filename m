Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1462F78924E
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 26 Aug 2023 01:27:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qZgD2-0002s6-3b
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 25 Aug 2023 23:27:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qZgCz-0002rz-RT
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 25 Aug 2023 23:27:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OUQeoEtJIbpPqZk/kirNVPmfBI5GvX7ZX6+7/bN246Q=; b=gc8nrHoO5rd8QRuyPfQAsb9whm
 iWZHmcClOGl3h47rFZsIHHHIWRhnbUU5eyS3Jx3PdZCIruQFRgpNS9T0VfxWnFRDTDHhQL4Dr+3n1
 UsfFdF3gk3KtNJhICVlUGvdy7CJ1LlSys/8+bigiEW7a5Sag8Ua91UKV3LFnY0PtaEbU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OUQeoEtJIbpPqZk/kirNVPmfBI5GvX7ZX6+7/bN246Q=; b=DmTcYzJ1aMgJ9pzgcHEJi8xMOb
 JQFUQs70vuaCBpNFXLi0booVIrKQaGV9yjQs0iyh6Yecs/i4zUOD+bS0pBtSTPQek/fXsagRKxlC9
 BOA3C29Tuv3vM3GBNGan0FjAp568h1KKiIeELyMclxnqDQ1fV8bY4oh2bMab6nVCpjjw=;
Received: from mail-ej1-f41.google.com ([209.85.218.41])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qZgCz-00Fe5w-J9 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 25 Aug 2023 23:27:18 +0000
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-99bc9e3cbf1so307447866b.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 25 Aug 2023 16:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693006031; x=1693610831;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OUQeoEtJIbpPqZk/kirNVPmfBI5GvX7ZX6+7/bN246Q=;
 b=EdL8/EpPVuuGrJTmF4ZwpwghuKIgp/YwINmxlX25PfW1ifNnIK1eWWq/1pIdv0MHlP
 HOcm10sSkiayZWN1KMRvjpxtGx0u8Bwzd4Yx+u8f4JJZXfkppBWQf9w4mkK+VohCYf3E
 ZHE0iaecQN3LBGjrOxxbmRyBAFduB/7LZHmDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693006031; x=1693610831;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OUQeoEtJIbpPqZk/kirNVPmfBI5GvX7ZX6+7/bN246Q=;
 b=g+uOw0YF0a8Y35LF7jZUipXTIYsEoyf4rTvEV9nzbYfZOtnksT6dNjnqcRBAF5C5L/
 ke6iiLF+/UIaYnaBHylTIA2GlbPLRRAyAse64YrSdmUs927MMSLCYnFEduy0C3NiHC8D
 NjvVRKva2XudNCTmGnw5ASXinkdLiOXIs6oeht5qORHm9ZyCt3yf4uVaN1kUapTslpIa
 pFRYEU1rZ+PgAhCGeRLLxPyiZBs3vA+SgScXu2gerieVINx3yrgv5o3X6mtO6VbAkUkn
 Q0U83nCC7nDRnsGYZ0x7PhlyzpShaGi71v5rM9TKBlCdpRUVgiqxvbsaosHmYwdeKf9s
 MeQg==
X-Gm-Message-State: AOJu0YxitmVNJY20WJovatFGCOoEm8JWZvdKdqDxrPwK92mz6As8x2wW
 HyKwerwTdUuhH3IrqtRRAulPpkAcxZ7jrMWhXZ7rqEmJ
X-Google-Smtp-Source: AGHT+IH/7yfiIFk2+wrehO69R+OSy04HtTDA5PYu1YYZhKIdu0CZQkczq6RR+iGGsASgcU/ZPFgsRA==
X-Received: by 2002:a17:906:6a1d:b0:99b:dd23:4f01 with SMTP id
 qw29-20020a1709066a1d00b0099bdd234f01mr21696251ejc.33.1693004585722; 
 Fri, 25 Aug 2023 16:03:05 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45]) by smtp.gmail.com with ESMTPSA id
 z3-20020a1709064e0300b009a19fa8d2e9sm1411325eju.206.2023.08.25.16.03.03
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Aug 2023 16:03:05 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4005f0a6c2bso14275e9.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 25 Aug 2023 16:03:03 -0700 (PDT)
X-Received: by 2002:a05:600c:501e:b0:3f7:e4d8:2569 with SMTP id
 n30-20020a05600c501e00b003f7e4d82569mr45412wmr.5.1693004583371; Fri, 25 Aug
 2023 16:03:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230824153233.1006420-1-dianders@chromium.org>
 <20230824083012.v11.4.Ie6c132b96ebbbcddbf6954b9469ed40a6960343c@changeid>
 <CAE-0n52iVDgZa8XT8KTMj12c_ESSJt7f7A0fuZ_oAMMqpGcSzA@mail.gmail.com>
In-Reply-To: <CAE-0n52iVDgZa8XT8KTMj12c_ESSJt7f7A0fuZ_oAMMqpGcSzA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 25 Aug 2023 16:02:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U24kF7WbZPKMbk=kJMU14+yFJXpGWWfj0fPbA9J6h0Eg@mail.gmail.com>
Message-ID: <CAD=FV=U24kF7WbZPKMbk=kJMU14+yFJXpGWWfj0fPbA9J6h0Eg@mail.gmail.com>
To: Stephen Boyd <swboyd@chromium.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Fri, Aug 25, 2023 at 3:27 PM Stephen Boyd <swboyd@chromium.org>
    wrote: > > Quoting Douglas Anderson (2023-08-24 08:30:30) > > diff --git
   a/arch/arm64/include/asm/irq.h b/arch/arm64/include/asm/ir [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.218.41 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.218.41 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qZgCz-00Fe5w-J9
Subject: Re: [Kgdb-bugreport] [PATCH v11 4/6] arm64: smp: Add arch support
 for backtrace using pseudo-NMI
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
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Marc Zyngier <maz@kernel.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Ard Biesheuvel <ardb@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 kgdb-bugreport@lists.sourceforge.net, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Valentin Schneider <vschneid@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Josh Poimboeuf <jpoimboe@kernel.org>, linux-arm-kernel@lists.infradead.org,
 D Scott Phillips <scott@os.amperecomputing.com>, ito-yuichi@fujitsu.com,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBGcmksIEF1ZyAyNSwgMjAyMyBhdCAzOjI34oCvUE0gU3RlcGhlbiBCb3lkIDxzd2Jv
eWRAY2hyb21pdW0ub3JnPiB3cm90ZToKPgo+IFF1b3RpbmcgRG91Z2xhcyBBbmRlcnNvbiAoMjAy
My0wOC0yNCAwODozMDozMCkKPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNt
L2lycS5oIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9pcnEuaAo+ID4gaW5kZXggZmFjMDhlMThi
Y2Q1Li41MGNlOGI2OTdmZjMgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNt
L2lycS5oCj4gPiArKysgYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2lycS5oCj4gPiBAQCAtNiw2
ICs2LDkgQEAKPiA+Cj4gPiAgI2luY2x1ZGUgPGFzbS1nZW5lcmljL2lycS5oPgo+ID4KPiA+ICt2
b2lkIGFyY2hfdHJpZ2dlcl9jcHVtYXNrX2JhY2t0cmFjZShjb25zdCBjcHVtYXNrX3QgKm1hc2ss
IGludCBleGNsdWRlX2NwdSk7Cj4KPiBTb21lIG5pdHMsIGJ1dCBvdGhlcndpc2UKPgo+IFJldmll
d2VkLWJ5OiBTdGVwaGVuIEJveWQgPHN3Ym95ZEBjaHJvbWl1bS5vcmc+Cj4KPiA+ICsjZGVmaW5l
IGFyY2hfdHJpZ2dlcl9jcHVtYXNrX2JhY2t0cmFjZSBhcmNoX3RyaWdnZXJfY3B1bWFza19iYWNr
dHJhY2UKPiA+ICsKPiA+ICBzdHJ1Y3QgcHRfcmVnczsKPiA+Cj4gPiAgaW50IHNldF9oYW5kbGVf
aXJxKHZvaWQgKCpoYW5kbGVfaXJxKShzdHJ1Y3QgcHRfcmVncyAqKSk7Cj4gPiBkaWZmIC0tZ2l0
IGEvYXJjaC9hcm02NC9rZXJuZWwvc21wLmMgYi9hcmNoL2FybTY0L2tlcm5lbC9zbXAuYwo+ID4g
aW5kZXggYTU4NDhmMWVmODE3Li5jODg5NmNiYzUzMjcgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2Fy
bTY0L2tlcm5lbC9zbXAuYwo+ID4gKysrIGIvYXJjaC9hcm02NC9rZXJuZWwvc21wLmMKPiA+IEBA
IC03MiwxMiArNzMsMTggQEAgZW51bSBpcGlfbXNnX3R5cGUgewo+ID4gICAgICAgICBJUElfQ1BV
X0NSQVNIX1NUT1AsCj4gPiAgICAgICAgIElQSV9USU1FUiwKPiA+ICAgICAgICAgSVBJX0lSUV9X
T1JLLAo+ID4gLSAgICAgICBOUl9JUEkKPiA+ICsgICAgICAgTlJfSVBJLAo+ID4gKyAgICAgICAv
Kgo+ID4gKyAgICAgICAgKiBBbnkgZW51bSA+PSBOUl9JUEkgYW5kIDwgTUFYX0lQSSBpcyBzcGVj
aWFsIGFuZCBub3QgdHJhY2FibGUKPiA+ICsgICAgICAgICogd2l0aCB0cmFjZV9pcGlfKgo+ID4g
KyAgICAgICAgKi8KPiA+ICsgICAgICAgSVBJX0NQVV9CQUNLVFJBQ0UgPSBOUl9JUEksCj4gPiAr
ICAgICAgIE1BWF9JUEkKPiA+ICB9Owo+ID4KPiA+ICBzdGF0aWMgaW50IGlwaV9pcnFfYmFzZSBf
X3JlYWRfbW9zdGx5Owo+ID4gIHN0YXRpYyBpbnQgbnJfaXBpIF9fcmVhZF9tb3N0bHkgPSBOUl9J
UEk7Cj4gPiAtc3RhdGljIHN0cnVjdCBpcnFfZGVzYyAqaXBpX2Rlc2NbTlJfSVBJXSBfX3JlYWRf
bW9zdGx5Owo+ID4gK3N0YXRpYyBzdHJ1Y3QgaXJxX2Rlc2MgKmlwaV9kZXNjW01BWF9JUEldIF9f
cmVhZF9tb3N0bHk7Cj4KPiBTaWRlIG5vdGU6IGl0IHdvdWxkIGJlIG5pY2UgdG8gbWFyayBpcGlf
ZGVzYyBhcyBfX3JvX2FmdGVyX2luaXQuIFNhbWUKPiBmb3IgbnJfaXBpIGFuZCBpcGlfaXJxX2Jh
c2UuCgpJJ2QgcmF0aGVyIG5vdCBjaGFuZ2UgaXQgaW4gdGhpcyBwYXRjaCBzaW5jZSBpdCdzIGEg
cHJlLWV4aXN0aW5nIGFuZApzZXBhcmF0ZSBpc3N1ZSwgYnV0IEkgY2FuIGFkZCBhIHBhdGNoIHRv
IHRoZSBlbmQgb2YgdGhlIHNlcmllcyBmb3IKdGhhdCBpZiBJIGVuZCB1cCBzcGlubmluZyBpdC4g
T3RoZXJ3aXNlIEkgY2FuIHNlbmQgYSBmb2xsb3ctdXAgcGF0Y2gKZm9yIGl0LgoKCj4gPiAgc3Rh
dGljIHZvaWQgaXBpX3NldHVwKGludCBjcHUpOwo+ID4KPiA+IEBAIC04NDUsNiArODUyLDIyIEBA
IHN0YXRpYyB2b2lkIF9fbm9yZXR1cm4gaXBpX2NwdV9jcmFzaF9zdG9wKHVuc2lnbmVkIGludCBj
cHUsIHN0cnVjdCBwdF9yZWdzICpyZWdzCj4gPiAgI2VuZGlmCj4gPiAgfQo+ID4KPiA+ICtzdGF0
aWMgdm9pZCBhcm02NF9iYWNrdHJhY2VfaXBpKGNwdW1hc2tfdCAqbWFzaykKPiA+ICt7Cj4gPiAr
ICAgICAgIF9faXBpX3NlbmRfbWFzayhpcGlfZGVzY1tJUElfQ1BVX0JBQ0tUUkFDRV0sIG1hc2sp
Owo+ID4gK30KPiA+ICsKPiA+ICt2b2lkIGFyY2hfdHJpZ2dlcl9jcHVtYXNrX2JhY2t0cmFjZShj
b25zdCBjcHVtYXNrX3QgKm1hc2ssIGludCBleGNsdWRlX2NwdSkKPgo+IENhbiB0aGlzIGJlICdi
b29sIGV4Y2x1ZGVfc2VsZicgaW5zdGVhZCBvZiBpbnQ/IFRoYXQgbWF0Y2hlcyBhbGwgb3RoZXIK
PiBpbXBsZW1lbnRhdGlvbnMgZnJvbSB3aGF0IEkgY2FuIHRlbGwuCgpOb3BlLiBTZWUgdGhlIHBh
cnQgb2YgdGhlIGNvbW1pdCBtZXNzYWdlIHRoYXQgc2F5czoKClRoaXMgcGF0Y2ggZGVwZW5kcyBv
biBjb21taXQgMzY3NTllMzQzZmY5ICgibm1pX2JhY2t0cmFjZTogYWxsb3cKZXhjbHVkaW5nIGFu
IGFyYml0cmFyeSBDUFUiKSBzaW5jZSB0aGF0IGNvbW1pdCBjaGFuZ2VkIHRoZSBwcm90b3R5cGUK
b2YgYXJjaF90cmlnZ2VyX2NwdW1hc2tfYmFja3RyYWNlKCksIHdoaWNoIHRoaXMgcGF0Y2ggaW1w
bGVtZW50cy4KCj4gPiArewo+ID4gKyAgICAgICAvKgo+ID4gKyAgICAgICAgKiBOT1RFOiB0aG91
Z2ggbm1pX3RyaWdnZXJfY3B1bWFza19iYWNrdHJhY2UgaGFzICJubWlfIiBpbiB0aGUgbmFtZSwK
Pgo+IFVTZSBubWlfdHJpZ2dlcl9jcHVtYXNrX2JhY2t0cmFjZSgpIHRvIGluZGljYXRlIGZ1bmN0
aW9uLgoKSSB3b24ndCBwbGFuIG9uIGRvaW5nIGFuIGltbWVkaWF0ZSBzcGluIGZvciB0aGlzIGFu
ZCBmb3Igbm93IEknbGwgd2FpdApmb3IgYWRkaXRpb25hbCBmZWVkYmFjay4gSWYgYSBtYWludGFp
bmVyIGlzIGdldHRpbmcgcmVhZHkgdG8gbGFuZAp0aGlzLCBJJ20gaGFwcHkgdG8gcG9zdCBhIG5l
dyB2ZXJzaW9uIHdpdGggdGhpcyBmaXggb3IgYWxzbyBoYXBweSBpZiBhCm1haW50YWluZXIgd2Fu
dHMgdG8gYWRkIHRoZSAiKCkiIHdoaWxlIGFwcGx5aW5nLgoKLURvdWcKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5n
IGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
