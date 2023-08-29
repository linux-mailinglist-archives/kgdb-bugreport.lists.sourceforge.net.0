Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A02B78C959
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 29 Aug 2023 18:09:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qb1Gz-00029e-07
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 29 Aug 2023 16:08:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qb1Gq-00029Q-Sv
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 29 Aug 2023 16:08:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tFxggldoPBim4o7gj2Za9WWmVK+cpYLI2YfSUTJ9s80=; b=Rxm93HbDrAKeBclyrUuryY0Cfd
 +aUd0flenATDN9F7T7DOW6zLRNq94nOxJ2sGSM52/1gANgp7ub4B20u8wtoWPe6LJQUOK0wSUcKE3
 LiI20zEpfHP9uy1r1ejN9tRqR5eKd8WCgjeNFjC4kuMMDFmxQ8SdRGYGNO36w6EjGE5g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tFxggldoPBim4o7gj2Za9WWmVK+cpYLI2YfSUTJ9s80=; b=Lc6jk6AMWj1uq8KR/n/JhzIKcA
 uxooP+/TqVjGr4C94+DVlnXK6usHs77r5cyFZLIRF96jTJuXwg+y5vM09+Er95Ef6g93tNY3vZ4s4
 mO4ioIPfQqm4nZmg4djyC9SV/gTRCR6I1tlU5PaWs5h5sgpjn8K666rJSj9mIh457B9E=;
Received: from mail-qt1-f176.google.com ([209.85.160.176])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qb1Gq-002YP9-O2 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 29 Aug 2023 16:08:49 +0000
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-4135d72c75bso1614401cf.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 29 Aug 2023 09:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693325322; x=1693930122;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tFxggldoPBim4o7gj2Za9WWmVK+cpYLI2YfSUTJ9s80=;
 b=cegbUnjMOj5zkiFRquFBV4l14i/Uh29m1vnFqL/+cD6/qCIkdF3BknQntObfYVqd/W
 0tHbaWw1n0pppKjDF2FbzxoxSl1ZUChmutNnWmyxUIgvfXyzHNAsEIO5qWxEF6YOiq/Y
 /mZS0sEresPjwXPkIikwGRx4L4Y/401noAYAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693325322; x=1693930122;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tFxggldoPBim4o7gj2Za9WWmVK+cpYLI2YfSUTJ9s80=;
 b=Fh7SpDEUjBKJkyACysm6HBCk4ywz7h23y/XtiNnzVMXUx9Xf58djGElT0DuxvSDs9A
 aM4xEFJJpjLjdsndHRwid8vDzJ1pjMtUf+s96E4ZK1zK4+9oyj4TRT/oRjr0bFHiAH3b
 +qENHDpGW4E9N86n4Axh6m1t1QpC4ouOd/FikICf5/tim4kTRjdWYV+IClv+hY0SlcQs
 mDBmPp8bLY6xXjgxzvUdB/zvWCxbaFVDNa2RYCh/9MHOoogBgJOU67adq7PsxCKfUPWS
 NeZcP56Zr8/9L4EwyiUEBokh34PvJ2pP6HlDo3fnxcqe5u9k2y79eU8WSu5VmXL5Vr0E
 4w8w==
X-Gm-Message-State: AOJu0YwkLU2jahQFmoded7eu2L+nd2fjTqSxKGb+7+odSvqdLcv2/MgQ
 Zg9m+7hYxQrnMQ+em4lr9pCMqlxh0AKArugn4iCL8Nqk
X-Google-Smtp-Source: AGHT+IEuWxJD0IzkhZnB18JLvjQjntjKwyl7+2HH74fbZix4KJfqMRmIpapc5wDK5Yg9s1Ln6bnhgg==
X-Received: by 2002:a0c:9cc2:0:b0:651:7997:230b with SMTP id
 j2-20020a0c9cc2000000b006517997230bmr1550290qvf.26.1693324998859; 
 Tue, 29 Aug 2023 09:03:18 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com.
 [209.85.208.47]) by smtp.gmail.com with ESMTPSA id
 i27-20020a0cab5b000000b0064f7150fadcsm3492294qvb.4.2023.08.29.09.03.17
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 09:03:18 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5232ce75e26so13011a12.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 29 Aug 2023 09:03:17 -0700 (PDT)
X-Received: by 2002:a50:c2c9:0:b0:522:28a1:2095 with SMTP id
 u9-20020a50c2c9000000b0052228a12095mr174413edf.3.1693324996834; Tue, 29 Aug
 2023 09:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230824153233.1006420-1-dianders@chromium.org>
 <20230824083012.v11.4.Ie6c132b96ebbbcddbf6954b9469ed40a6960343c@changeid>
 <TYCPR01MB11025E1AB8ED779D1D67F05CBE5E7A@TYCPR01MB11025.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB11025E1AB8ED779D1D67F05CBE5E7A@TYCPR01MB11025.jpnprd01.prod.outlook.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Aug 2023 09:03:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UZeHicVLn3GAxdFrtUbwHnb8GEvsfe9BM7cfBrTrK=Fg@mail.gmail.com>
Message-ID: <CAD=FV=UZeHicVLn3GAxdFrtUbwHnb8GEvsfe9BM7cfBrTrK=Fg@mail.gmail.com>
To: "Tomohiro Misono (Fujitsu)" <misono.tomohiro@fujitsu.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Mon, Aug 28, 2023 at 10:23 PM Tomohiro Misono (Fujitsu)
    <misono.tomohiro@fujitsu.com> wrote: > > > 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.160.176 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.160.176 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qb1Gq-002YP9-O2
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
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Valentin Schneider <vschneid@redhat.com>, Stephen Boyd <swboyd@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>, Josh Poimboeuf <jpoimboe@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 D Scott Phillips <scott@os.amperecomputing.com>,
 "Yuichi Ito \(Fujitsu\)" <ito-yuichi@fujitsu.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBNb24sIEF1ZyAyOCwgMjAyMyBhdCAxMDoyM+KAr1BNIFRvbW9oaXJvIE1pc29ubyAo
RnVqaXRzdSkKPG1pc29uby50b21vaGlyb0BmdWppdHN1LmNvbT4gd3JvdGU6Cj4KPiA+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBTdWJqZWN0OiBbUEFUQ0ggdjExIDQvNl0gYXJtNjQ6
IHNtcDogQWRkIGFyY2ggc3VwcG9ydCBmb3IgYmFja3RyYWNlIHVzaW5nCj4gPiBwc2V1ZG8tTk1J
Cj4gPgo+ID4gRW5hYmxlIGFyY2hfdHJpZ2dlcl9jcHVtYXNrX2JhY2t0cmFjZSgpIHN1cHBvcnQg
b24gYXJtNjQuIFRoaXMgZW5hYmxlcwo+ID4gdGhpbmdzIG11Y2ggbGlrZSB0aGV5IGFyZSBlbmFi
bGVkIG9uIGFybTMyIChpbmNsdWRpbmcgc29tZSBvZiB0aGUKPiA+IGZ1bmt5IGxvZ2ljIGFyb3Vu
ZCBOUl9JUEksIG5yX2lwaSwgYW5kIE1BWF9JUEkpIGJ1dCB3aXRoIHRoZQo+ID4gZGlmZmVyZW5j
ZSB0aGF0LCB1bmxpa2UgYXJtMzIsIHdlJ2xsIHRyeSB0byBlbmFibGUgdGhlIGJhY2t0cmFjZSB0
bwo+ID4gdXNlIHBzZXVkby1OTUkuCj4gPgo+ID4gTk9URTogdGhpcyBwYXRjaCBpcyBhIHNxdWFz
aCBvZiB0aGUgbGl0dGxlIGJpdCBvZiBjb2RlIGFkZGluZyB0aGUKPiA+IGFiaWxpdHkgdG8gbWFy
ayBhbiBJUEkgdG8gdHJ5IHRvIHVzZSBwc2V1ZG8tTk1JIHBsdXMgdGhlIGxpdHRsZSBiaXQgb2YK
PiA+IGNvZGUgdG8gaG9vayB0aGluZ3MgdXAgZm9yIGtnZGIuIFRoaXMgYXBwcm9hY2ggd2FzIGRl
Y2lkZWQgdXBvbiBpbiB0aGUKPiA+IGRpc2N1c3Npb24gb2YgdjkgWzFdLgo+ID4KPiA+IFRoaXMg
cGF0Y2ggZGVwZW5kcyBvbiBjb21taXQgMzY3NTllMzQzZmY5ICgibm1pX2JhY2t0cmFjZTogYWxs
b3cKPgo+IEhpLAo+IElzIHRoaXMgY29tbWl0IElEIHZhbGlkPyBJIGJlbGlldmUgdGhpcyBjb21t
aXQgaXMgbm90IGluY2x1ZGVkIGluIHRoZQo+IG1haW5saW5lIHlldC4gT3RoZXIgdGhhbiB0aGlz
LAo+ICBSZXZpZXdlZC1ieTogTWlzb25vIFRvbW9oaXJvIDxtaXNvbm8udG9tb2hpcm9AZnVqaXRz
dS5jb20+CgpBaCwgZ29vZCBjYWxsLiBJIG11c3QgaGF2ZSBncmFiYmVkIHRoYXQgZ2l0IGhhc2gg
YmVmb3JlIHRoZSBjb21taXQKbW92ZWQgZnJvbSBBbmRyZXcgTW9ydG9uJ3MgdW5zdGFibGUgYnJh
bmNoIHRvIGhpcyBzdGFibGUgYnJhbmNoLiBBcwpmYXIgYXMgSSBjYW4gdGVsbCwgaXQgc2hvdWxk
IGJlIGNvbW1pdCA4ZDUzOWI4NGYxZTMgKCJubWlfYmFja3RyYWNlOgphbGxvdyBleGNsdWRpbmcg
YW4gYXJiaXRyYXJ5IENQVSIpLiAuLi5hdCBsZWFzdCB0aGF0J3Mgd2hhdCdzIGluCmxpbnV4bmV4
dCB0b2RheS4gVGhhdCBhbHNvIGFwcGVhcnMgdG8gbWF0Y2ggdGhlIGNvbW1pdCBoYXNoIGluIHRo
ZQpwdWxsIHJlcXVlc3QgdGhhdCBBbmRyZXcganVzdCBzZW50IHRvIExpbnVzIFsxXS4KCkknbGwg
dXBkYXRlIHRoZSBnaXQgaGFzaCBhbmQgYWRkIHlvdXIgdGFnIGluIHYxMiwgd2hpY2ggSSdtIGN1
cnJlbnRseQphaW1pbmcgdG8gc2VuZCBvdXQgdG9tb3Jyb3cuCgpbMV0gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvci8yMDIzMDgyODIyNTQzMS4zNTRkM2QyZDNiODBlZTViODhlNjVlYjVAbGludXgt
Zm91bmRhdGlvbi5vcmcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2tnZGItYnVncmVwb3J0Cg==
