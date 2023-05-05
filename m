Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AEB6F86F2
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 May 2023 18:44:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1puyXO-00015Z-FL
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 05 May 2023 16:44:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1puyXN-00015T-9Z
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 May 2023 16:44:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EpDnC2craXa71PgQOtY/fZMYoEOsNHjFRztUygfINOs=; b=lJLmLmYYWCo1zQAPoESU2KwObA
 qH4jSojLVei7gskl7u+/5s/asHjaFbpk1m6G33MeANNmQJiPmKevJHSbylvvlDEhEPlseWd7KX78m
 gU/cbiyFTDyXYr2znGdd56xkJcwEmXrfh1tkHubUUSR4Nuwc3zOhYNuRIsdr0VkRj9Yk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EpDnC2craXa71PgQOtY/fZMYoEOsNHjFRztUygfINOs=; b=UzDCcWE2xCWO2bj1dpHVbSLuDV
 w0tRf6zHh9MEGAr+/YxwMwRUmTwHiB23/XcS4yrhpHbJiuHpo5P24Kw6AYuzmF9XA+mljpOJnZ4RW
 KgbtgHY3kr62qW183epei/tmJEdg5FZ6owIGEUi2VI4m/H6D29+3Sz5Xg02tIqolpHc0=;
Received: from mail-pf1-f179.google.com ([209.85.210.179])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1puyXN-00FSY9-2K for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 May 2023 16:44:05 +0000
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-6439bbc93b6so1017794b3a.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 05 May 2023 09:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683305039; x=1685897039;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EpDnC2craXa71PgQOtY/fZMYoEOsNHjFRztUygfINOs=;
 b=PisF19bWpm1Qe2MN3s+w4Wwho2C7lCAQWENoCWHZhs2rN85qEvHTbf1kzzPT/o5iPh
 z+om+deioBQ9DEayCMIxhl5QGCIxXbhx0mC6aUrMA5JXLlqOeIIZjwLLDY6Tww1g6r/o
 BjGPVoyVb/xtPpBfKmC/YDKgFEp0s7TFEbuBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683305039; x=1685897039;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EpDnC2craXa71PgQOtY/fZMYoEOsNHjFRztUygfINOs=;
 b=gtZM/xRdWkMqyppMoWLmvJz5kd3QRJ8vtb5wzWKK+jvxGqS9WkY1CpamI835CDUTVJ
 3HhdapyvSP61Q4FCJ3TgqYr9WLf35TpSYDOeyK2s3Qn3Gq48CaoMAg3bofMeY1buJJQt
 kQOtAWgCAuIffBxqSN4R3f9O0J42kCcl9wyrmBe03cPtyhgV3Hh33UeOkxKvnKy6sGTt
 WQKS762mnqXu3ZaiU1D7jjIgXc793IegKrwBlKHL67bh+fqCornTmgqik2xDc3/GDSsI
 5206NHSfBzagdGZ5YnIAef3qSS5QGitn2Y2wMP9xWzWGeKuLFAbnqRk2LZbSFamY/dlo
 Gepg==
X-Gm-Message-State: AC+VfDzX+Pnp/QwEgur95999z0ruay6WAi73L7QQlo7u25tySRGknyiJ
 34Q3ReHauVfV6iSDSs9nOYpEuZ2chTqTrjl3P0A=
X-Google-Smtp-Source: ACHHUZ4lx3ywJry21RbodNGLn+WiWwSLYUjOdXpgTayTBMuQr9ykleMzNvVqxIvgvmOojnxJB48+dw==
X-Received: by 2002:a05:6a00:992:b0:63b:89ba:fc9c with SMTP id
 u18-20020a056a00099200b0063b89bafc9cmr3472444pfg.27.1683305038941; 
 Fri, 05 May 2023 09:43:58 -0700 (PDT)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com.
 [209.85.214.172]) by smtp.gmail.com with ESMTPSA id
 t13-20020aa7938d000000b0063f2a5a59d1sm1825611pfe.190.2023.05.05.09.43.58
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 09:43:58 -0700 (PDT)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1a7ff4a454eso605095ad.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 05 May 2023 09:43:58 -0700 (PDT)
X-Received: by 2002:a05:622a:1981:b0:3ed:210b:e698 with SMTP id
 u1-20020a05622a198100b003ed210be698mr317734qtc.7.1683304539483; Fri, 05 May
 2023 09:35:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.13.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
 <CSDZSKA38AEF.FY7J3JXBJX4I@wheely>
In-Reply-To: <CSDZSKA38AEF.FY7J3JXBJX4I@wheely>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 5 May 2023 09:35:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XDfbx3UaP7DV63tASE5Md7siS-EnORD_3T-4yYaEQ7ww@mail.gmail.com>
Message-ID: <CAD=FV=XDfbx3UaP7DV63tASE5Md7siS-EnORD_3T-4yYaEQ7ww@mail.gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Thu, May 4, 2023 at 7:36 PM Nicholas Piggin <npiggin@gmail.com>
    wrote: > > On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote: >
   > From: Colin Cross <ccross@android.com> > > > > Implement [...] 
 
 Content analysis details:   (-0.4 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.210.179 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.210.179 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puyXN-00FSY9-2K
Subject: Re: [Kgdb-bugreport] [PATCH v4 13/17] watchdog/hardlockup: detect
 hard lockups using secondary (buddy) CPUs
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>, ravi.v.shankar@intel.com,
 kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 mpe@ellerman.id.au, christophe.leroy@csgroup.eu, Chen-Yu Tsai <wens@csie.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Petr Mladek <pmladek@suse.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>, Colin Cross <ccross@android.com>,
 Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>,
 linux-arm-kernel@lists.infradead.org, ito-yuichi@fujitsu.com,
 linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBUaHUsIE1heSA0LCAyMDIzIGF0IDc6MzbigK9QTSBOaWNob2xhcyBQaWdnaW4gPG5w
aWdnaW5AZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIEZyaSBNYXkgNSwgMjAyMyBhdCA4OjEzIEFN
IEFFU1QsIERvdWdsYXMgQW5kZXJzb24gd3JvdGU6Cj4gPiBGcm9tOiBDb2xpbiBDcm9zcyA8Y2Ny
b3NzQGFuZHJvaWQuY29tPgo+ID4KPiA+IEltcGxlbWVudCBhIGhhcmRsb2NrdXAgZGV0ZWN0b3Ig
dGhhdCBkb2Vzbid0IGRvZXNuJ3QgbmVlZCBhbnkgZXh0cmEKPiA+IGFyY2gtc3BlY2lmaWMgc3Vw
cG9ydCBjb2RlIHRvIGRldGVjdCBsb2NrdXBzLiBJbnN0ZWFkIG9mIHVzaW5nCj4gPiBzb21ldGhp
bmcgYXJjaC1zcGVjaWZpYyB3ZSB3aWxsIHVzZSB0aGUgYnVkZHkgc3lzdGVtLCB3aGVyZSBlYWNo
IENQVQo+ID4gd2F0Y2hlcyBvdXQgZm9yIGFub3RoZXIgb25lLiBTcGVjaWZpY2FsbHksIGVhY2gg
Q1BVIHdpbGwgdXNlIGl0cwo+ID4gc29mdGxvY2t1cCBocnRpbWVyIHRvIGNoZWNrIHRoYXQgdGhl
IG5leHQgQ1BVIGlzIHByb2Nlc3NpbmcgaHJ0aW1lcgo+ID4gaW50ZXJydXB0cyBieSB2ZXJpZnlp
bmcgdGhhdCBhIGNvdW50ZXIgaXMgaW5jcmVhc2luZy4KPgo+IFBvd2VycGMncyB3YXRjaGRvZyBo
YXMgYW4gU01QIGNoZWNrZXIsIGRpZCB5b3Ugc2VlIGl0PwoKTm8sIEkgd2Fzbid0IGF3YXJlIG9m
IGl0LiBJbnRlcmVzdGluZywgaXQgc2VlbXMgdG8gYmFzaWNhbGx5IGVuYWJsZQpib3RoIHR5cGVz
IG9mIGhhcmRsb2NrdXAgZGV0ZWN0b3JzIHRvZ2V0aGVyLiBJZiB0aGF0IHJlYWxseSBjYXRjaGVz
Cm1vcmUgbG9ja3VwcywgaXQgc2VlbXMgbGlrZSB3ZSBjb3VsZCBkbyB0aGUgc2FtZSB0aGluZyBm
b3IgdGhlIGJ1ZGR5CnN5c3RlbS4gSWYgcGVvcGxlIHdhbnQsIEkgZG9uJ3QgdGhpbmsgaXQgd291
bGQgYmUgdmVyeSBoYXJkIHRvIG1ha2UKdGhlIGJ1ZGR5IHN5c3RlbSBfbm90XyBleGNsdXNpdmUg
b2YgdGhlIHBlcmYgc3lzdGVtLiBJbnN0ZWFkIG9mIGhhdmluZwp0aGUgYnVkZHkgc3lzdGVtIGlt
cGxlbWVudCB0aGUgIndlYWsiIGZ1bmN0aW9ucyBJIGNvdWxkIGp1c3QgY2FsbCB0aGUKYnVkZHkg
ZnVuY3Rpb25zIGluIHRoZSByaWdodCBwbGFjZXMgZGlyZWN0bHkgYW5kIGxlYXZlIHRoZSAid2Vh
ayIKZnVuY3Rpb25zIGZvciBhIG1vcmUgdHJhZGl0aW9uYWwgaGFyZGxvY2t1cCBkZXRlY3RvciB0
byBpbXBsZW1lbnQuCk9waW5pb25zPwoKTWF5YmUgYWZ0ZXIgYWxsIHRoaXMgbGFuZHMsIHRoZSBw
b3dlcnBjIHdhdGNoZG9nIGNvdWxkIG1vdmUgdG8gdXNlIHRoZQpjb21tb24gY29kZT8gQXMgZXZp
ZGVuY2VkIGJ5IHRoaXMgcGF0Y2ggc2VyaWVzLCB0aGVyZSdzIG5vdCByZWFsbHkgYQpyZWFzb24g
Zm9yIHRoZSBTTVAgZGV0ZWN0aW9uIHRvIGJlIHBsYXRmb3JtIHNwZWNpZmljLgoKCj4gSXQncyBh
bGwgdG8KPiBhbGwgcmF0aGVyIHRoYW4gYnVkZHkgd2hpY2ggbWFrZXMgaXQgbW9yZSBjb21wbGlj
YXRlZCBidXQgYXJndWFibHkKPiBiaXQgYmV0dGVyIGZ1bmN0aW9uYWxpdHkuCgpDYW4geW91IGNv
bWUgdXAgd2l0aCBhbiBleGFtcGxlIGNyYXNoIHdoZXJlIHRoZSAiYWxsIHRvIGFsbCIgd291bGQK
d29yayBiZXR0ZXIgdGhhbiB0aGUgc2ltcGxlIGJ1ZGR5IHN5c3RlbSBwcm92aWRlZCBieSB0aGlz
IHBhdGNoPyBJdApzZWVtcyBsaWtlIHRoZXkgd291bGQgYmUgZXF1aXZhbGVudCwgYnV0IEkgY291
bGQgYmUgbWlzc2luZyBzb21ldGhpbmcuClNwZWNpZmljYWxseSB0aGV5IGJvdGggbmVlZCBhdCBs
ZWFzdCBvbmUgbm9uLWxvY2tlZC11cCBDUFUgdG8gZGV0ZWN0IGEKcHJvYmxlbS4gSWYgb25lIG9y
IG1vcmUgQ1BVcyBpcyBsb2NrZWQgdXAgdGhlbiB3ZSdsbCBhbHdheXMgZGV0ZWN0IGl0LgpJIHN1
cHBvc2UgbWF5YmUgeW91IGNvdWxkIHByb3ZpZGUgYSBiZXR0ZXIgZXJyb3IgbWVzc2FnZSBhdCBs
b2NrdXAKdGltZSBzYXlpbmcgdGhhdCBzZXZlcmFsIENQVXMgd2VyZSBsb2NrZWQgdXAgYW5kIHRo
YXQgY291bGQgYmUKaGVscGZ1bC4gRm9yIG5vdywgSSdkIGtlZXAgdGhlIGN1cnJlbnQgYnVkZHkg
c3lzdGVtIHRoZSB3YXkgaXQgaXMgYW5kCmlmIHlvdSB3YW50IHRvIHByb3ZpZGUgYSBwYXRjaCBp
bXByb3ZpbmcgdGhpbmdzIHRvIGJlICJhbGwtdG8tYWxsIiBpbgp0aGUgZnV0dXJlIHRoYXQgd291
bGQgYmUgaW50ZXJlc3RpbmcgdG8gcmV2aWV3LgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1
Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
