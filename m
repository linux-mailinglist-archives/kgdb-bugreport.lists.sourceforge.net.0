Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB78C727339
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  8 Jun 2023 01:40:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q72lu-0008Bu-8j
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 07 Jun 2023 23:40:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q72ls-0008Bj-JJ
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 07 Jun 2023 23:40:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GavxFaHwlTnRx3gt9uObRrogsyEG4oEATw/XGEuAuMI=; b=cm/P/MnBmcw/KDiSW/y1wmzg9s
 CxR2O5FeFA0peOgzwipCTLG8jHr6oOz6MgJ4NXnB5ZHwSiMj2D4wdJXZ4CmdN3uEUqSrkPXH9S7sZ
 RY455NNL+nUAZBeJ1vbCQTSKCuIZwukM/FpQS6NLiJJVovFTjUtb/Z2lk0z3TR7iOw8U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GavxFaHwlTnRx3gt9uObRrogsyEG4oEATw/XGEuAuMI=; b=I0AmijTRsypDUEivCA1f68J+H7
 WvsojwdGyzO6mwTrkso/Pl/KqcWsU18pKoHvxqqvZQh6tp802ff/H28elTyyec2V+YWbhm1IjVkmO
 Ec6x66GGhQvuCxPq6jx4KWq863sK69sc3P83fd+Fr08C3hM/fItXnhQVQd+6Gi8iQ6rE=;
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q72lr-00027E-Rz for kgdb-bugreport@lists.sourceforge.net;
 Wed, 07 Jun 2023 23:40:56 +0000
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-6b1576c2f6eso4141835a34.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 07 Jun 2023 16:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686181249; x=1688773249;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GavxFaHwlTnRx3gt9uObRrogsyEG4oEATw/XGEuAuMI=;
 b=YAXDG+2RJfchwVkS6KByyTeZhV0LyeFBH/9tGPCKk8Jf4HsUNy/3jNlvLcUYOp7TGy
 nlVoZITrkdDD5sL+MO01YAs5UpJ07kMv7FJ6JD+eiP2/TelSnL83tMecTnupIT+BQJ2v
 w2OLIGuDGLBETZQkaeqlai2m58+C98mXlQXUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686181249; x=1688773249;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GavxFaHwlTnRx3gt9uObRrogsyEG4oEATw/XGEuAuMI=;
 b=H3mv8tlS5atEyWibHPmaPLxm4GCuOZlEjjM3nY7R61qrEUNtpH8idFYQTUV4OTy8xz
 ijt9PhFPl43r9VLExhNefmS4hl3SyYGrNKri20BmJdT2diM53xXtKDg+NfebFpEqktlj
 +WMcQr2xAt6cdfvAu06F9qOqgpMr/Bt98GeO50GUoNlD+OY6V1TtpuUtmcqZOvm/UFO8
 jmF4A222wd/sHVNdy9ZZbpkpmo0KXzvucpMgZ0IUYVEiufHRFHXtbx7mfkiPLAwAUJTc
 PXdtdqGaP0paVasykkENHMUtfbpbU9qxpm6SINpJbMXDnkmTEJUb6drnUbDQU/yjr8FW
 NeYg==
X-Gm-Message-State: AC+VfDwJKeagn5AfDzh1iQyEkjwSA7lWzeP3zXFbb7XS7zECph5tFYWL
 kBvpxL3OIrDrnS5PN8FpsfE+XNw4ooWRZdgWFiM=
X-Google-Smtp-Source: ACHHUZ5y5VFDMlVyWzkhayZ/vIxhYq6m3u6hNa3f0Fcc8tGxN21iHLZx3SNkkcVIndDVlI5Yp8eAxQ==
X-Received: by 2002:a9d:750a:0:b0:6af:9219:25ae with SMTP id
 r10-20020a9d750a000000b006af921925aemr6970755otk.11.1686181249493; 
 Wed, 07 Jun 2023 16:40:49 -0700 (PDT)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com.
 [209.85.210.45]) by smtp.gmail.com with ESMTPSA id
 u1-20020a4aa341000000b0055b100649e4sm1840372ool.23.2023.06.07.16.40.49
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jun 2023 16:40:49 -0700 (PDT)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-6af6de9fb74so6756101a34.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 07 Jun 2023 16:40:49 -0700 (PDT)
X-Received: by 2002:a5e:a611:0:b0:777:aa56:f5e9 with SMTP id
 q17-20020a5ea611000000b00777aa56f5e9mr11095206ioi.16.1686180931677; Wed, 07
 Jun 2023 16:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230607152432.5435-1-pmladek@suse.com>
 <20230607152432.5435-4-pmladek@suse.com>
In-Reply-To: <20230607152432.5435-4-pmladek@suse.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 7 Jun 2023 16:35:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XvUAeKFAcOD_xaT2to45=CCiKJMRbi-uxgrZ4mWN7hZg@mail.gmail.com>
Message-ID: <CAD=FV=XvUAeKFAcOD_xaT2to45=CCiKJMRbi-uxgrZ4mWN7hZg@mail.gmail.com>
To: Petr Mladek <pmladek@suse.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Wed, Jun 7, 2023 at 8:25 AM Petr Mladek <pmladek@suse.com>
    wrote: > > arch_touch_nmi_watchdog() needs a different implementation for
    various > hardlockup detector implementations. And it does not [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.210.50 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.210.50 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q72lr-00027E-Rz
Subject: Re: [Kgdb-bugreport] [PATCH 3/7] watchdog/hardlockup: Declare
 arch_touch_nmi_watchdog() only in linux/nmi.h
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
 Nicholas Piggin <npiggin@gmail.com>, linux-perf-users@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, sparclinux@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBXZWQsIEp1biA3LCAyMDIzIGF0IDg6MjXigK9BTSBQZXRyIE1sYWRlayA8cG1sYWRl
a0BzdXNlLmNvbT4gd3JvdGU6Cj4KPiBhcmNoX3RvdWNoX25taV93YXRjaGRvZygpIG5lZWRzIGEg
ZGlmZmVyZW50IGltcGxlbWVudGF0aW9uIGZvciB2YXJpb3VzCj4gaGFyZGxvY2t1cCBkZXRlY3Rv
ciBpbXBsZW1lbnRhdGlvbnMuIEFuZCBpdCBkb2VzIG5vdGhpbmcgd2hlbgo+IGFueSBoYXJkbG9j
a3VwIGRldGVjdG9yIGlzIG5vdCBidWlsZCBhdCBhbGwuCgpzL2J1aWxkL2J1aWx0LwoKCj4gYXJj
aF90b3VjaF9ubWlfd2F0Y2hkb2coKSBoYXMgdG8gYmUgZGVjbGFyZWQgaW4gbGludXgvbm1pLmgu
IEl0IGlzIGRvbmUKPiBkaXJlY3RseSBpbiB0aGlzIGhlYWRlciBmaWxlIGZvciB0aGUgcGVyZiBh
bmQgYnVkZHkgZGV0ZWN0b3JzLiBBbmQgaXQKPiBpcyBkb25lIGluIHRoZSBpbmNsdWRlZCBhc20v
bGludXguaCBmb3IgYXJjaCBzcGVjaWZpYyBkZXRlY3RvcnMuCj4KPiBUaGUgcmVhc29uIHByb2Jh
Ymx5IGlzIHRoYXQgdGhlIGFyY2ggc3BlY2lmaWMgdmFyaWFudHMgYnVpbGQgdGhlIGNvZGUKPiB1
c2luZyBhbm90aGVyIGNvbmRpdGlvbnMuIEZvciBleGFtcGxlLCBwb3dlcnBjNjQvc3BhcmM2NCBi
dWlsZHMgdGhlIGNvZGUKPiB3aGVuIENPTkZJR19QUENfV0FUQ0hET0cgaXMgZW5hYmxlZC4KPgo+
IEFub3RoZXIgcmVhc29uIG1pZ2h0IGJlIHRoYXQgdGhlc2UgYXJjaGl0ZWN0dXJlcyBkZWZpbmUg
bW9yZSBmdW5jdGlvbnMKPiBpbiBhc20vbm1pLmggYW55d2F5Lgo+Cj4gSG93ZXZlciB0aGUgZ2Vu
ZXJpYyBjb2RlIGFjdHVhbGx5IGtub3dzIHRoZSBpbmZvcm1hdGlvbi4gVGhlIGNvbmZpZwo+IHZh
cmlhYmxlcyBIQVZFX05NSV9XQVRDSERPRyBhbmQgSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX0FS
Q0ggYXJlIHVzZWQKPiB0byBkZWNpZGUgd2hldGhlciB0byBidWlsZCB0aGUgYnVkZHkgZGV0ZWN0
b3IuCj4KPiBJbiBwYXJ0aWN1bGFyLCBDT05GSUdfSEFSRExPQ0tVUF9ERVRFQ1RPUiBpcyBzZXQg
b25seSB3aGVuIGEgZ2VuZXJpYwo+IG9yIGFyY2gtc3BlY2lmaWMgaGFyZGxvY2t1cCBkZXRlY3Rv
ciBpcyBidWlsdC4gVGhlIG9ubHkgZXhjZXB0aW9uCj4gaXMgc3BhcmM2NCB3aGljaCBpZ25vcmVz
IHRoZSBnbG9iYWwgSEFSRExPQ0tVUF9ERVRFQ1RPUiBzd2l0Y2guCj4KPiBUaGUgaW5mb3JtYXRp
b24gYWJvdXQgc3BhcmM2NCBpcyBhIGJpdCBjb21wbGljYXRlZC4gVGhlIGhhcmRsb2NrdXAKPiBk
ZXRlY3RvciBpcyBidWlsdCB0aGVyZSB3aGVuIENPTkZJR19IQVZFX05NSV9XQVRDSERPRyBpcyBz
ZXQgYW5kCj4gQ09ORklHX0hBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9BUkNIIGlzIG5vdCBzZXQu
Cj4KPiBQZW9wbGUgbWlnaHQgd29uZGVyIHdoZXRoZXIgdGhpcyBjaGFuZ2UgcmVhbGx5IG1ha2Vz
IHRoaW5ncyBlYXNpZXIuCj4gVGhlIG1vdGl2YXRpb24gaXM6Cj4KPiAgICsgVGhlIGN1cnJlbnQg
bG9naWMgaW4gbGludXgvbm1pLmggaXMgZmFyIGZyb20gb2J2aW91cy4KPiAgICAgRm9yIGV4YW1w
bGUsIGFyY2hfdG91Y2hfbm1pX3dhdGNoZG9nKCkgaXMgZGVmaW5lZCBhcyB7fSB3aGVuCj4gICAg
IG5laXRoZXIgQ09ORklHX0hBUkRMT0NLVVBfREVURUNUT1JfQ09VTlRTX0hSVElNRVIgbm9yCj4g
ICAgIENPTkZJR19IQVZFX05NSV9XQVRDSERPRyBpcyBkZWZpbmVkLgo+Cj4gICArIFRoZSBjaGFu
Z2Ugc3luY2hyb25pemVzIHRoZSBjaGVja3MgaW4gbGliL0tjb25maWcuZGVidWcgYW5kCj4gICAg
IGluIHRoZSBnZW5lcmljIGNvZGUuCj4KPiAgICsgSXQgaXMgYSBzdGVwIHRoYXQgd2lsbCBoZWxw
IGNsZWFuaW5nIEhBVkVfTk1JX1dBVENIRE9HIHJlbGF0ZWQKPiAgICAgY2hlY2tzLgo+Cj4gVGhl
IGNoYW5nZSBzaG91bGQgbm90IGNoYW5nZSB0aGUgZXhpc3RpbmcgYmVoYXZpb3IuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBQZXRyIE1sYWRlayA8cG1sYWRla0BzdXNlLmNvbT4KPiAtLS0KPiAgYXJjaC9w
b3dlcnBjL2luY2x1ZGUvYXNtL25taS5oIHwgIDIgLS0KPiAgYXJjaC9zcGFyYy9pbmNsdWRlL2Fz
bS9ubWkuaCAgIHwgIDEgLQo+ICBpbmNsdWRlL2xpbnV4L25taS5oICAgICAgICAgICAgfCAxMyAr
KysrKysrKysrLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkKClRoaXMgbG9va3MgcmlnaHQgYW5kIGlzIGEgbmljZSBjbGVhbnVwLgoKUmV2aWV3
ZWQtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBt
YWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
