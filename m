Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BE372730B
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  8 Jun 2023 01:34:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q72fu-0008Nf-Gl
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 07 Jun 2023 23:34:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q72fs-0008NQ-7e
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 07 Jun 2023 23:34:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oKEziAGkCW2jO8QMx9VTvzfLmO/bLdAIdfdMBgrtF0Q=; b=JWOhIRW51h80rBhWcsGei4zeCK
 KDd1gpL0Ce0CQ7k1UsjOUGWksM3L/XqZM/WZqgPa+GXiRNULeYu3qbDk5gfJDQySMTiVjTMXIR+UE
 5FcHeyzE+1VEmzpf7aajJcbKN1BT0wvAU0bCI1hrpdYOrLUSoco+qveBEbInJ1usTQN4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oKEziAGkCW2jO8QMx9VTvzfLmO/bLdAIdfdMBgrtF0Q=; b=A5102DtRA1n1rZjVUt8NUKt5hY
 9pr3pDS91lODuMD569Bz8DmS6RwAIPrqNwMUJJ0Q2knVqr4X9sEHMjPZ6voV0WlHOQMRbUUaQizFC
 vynCH+vLsEqv4YOhV5APPgkYJzHnxTHNWXZI3f6g0hVkQ4iXrQ5JTQPXpQAz6feE5Iys=;
Received: from mail-il1-f182.google.com ([209.85.166.182])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q72fq-00E9qU-7b for kgdb-bugreport@lists.sourceforge.net;
 Wed, 07 Jun 2023 23:34:44 +0000
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-33b6c47898dso10286645ab.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 07 Jun 2023 16:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686180874; x=1688772874;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oKEziAGkCW2jO8QMx9VTvzfLmO/bLdAIdfdMBgrtF0Q=;
 b=F6wdPzX5FUDEq0AnubAA0X0oRetMIiPWDnCmAd7XJ7qbkBXIQqOUAfDYB/XoT80xhV
 3geAQrbCc6Er52EjNMUsfbQc3ILUnH0//avnz8c5O+0MdNWqhWcsMkG8UX69MmVNxvFJ
 vkkbkVW1pnxPONFY6dZLVQpGAhXMjj2z4mswI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686180874; x=1688772874;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oKEziAGkCW2jO8QMx9VTvzfLmO/bLdAIdfdMBgrtF0Q=;
 b=QT7obwvaHxdJ8MGPOxDexq9FNlS8VXsTo8CRRTGQuiotEwOWofKKkHnyWxDgeVivnz
 vy9KBGX/pk+r7iOscsydJuQswSe13EaRsGjyp0xMxQieIW07M7x4jMElNboPOCUnofid
 PXgnZtqjkFQyA0JH8ysMmZYhAAIj/3FwFgEWVKcYJEbws32ibtKI1VPdIPNfuu2aO5wW
 EIpsXWq6epTRMzlxRdJs6kzNzrFr+2CAhJEPwLVK1z419GUvEQ31BBeW/G4CW6aBK7UA
 n4XResuWRMlxMb2fQrziVLWysijSO86pfbwj+DYOWg+m68swPexuGQ7FYRqHF2sciHsk
 nivw==
X-Gm-Message-State: AC+VfDwcAdBWZGGS3931P+0jGp2Se/EpEJSsSJ3ht97orVmen5lq738r
 Lk4Wf5SZhktL1C59giQ0JPWr2ZZ3sJxI9SLmw/s=
X-Google-Smtp-Source: ACHHUZ7oGiXoGbKkjbotYMNtXvlHmxGwXkBs3nguyzQvNMQteNsmK7oso4beCrPxcxFNWQmR7+b3Qg==
X-Received: by 2002:a92:c84d:0:b0:331:7203:b8b0 with SMTP id
 b13-20020a92c84d000000b003317203b8b0mr10167476ilq.3.1686180874002; 
 Wed, 07 Jun 2023 16:34:34 -0700 (PDT)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com.
 [209.85.166.181]) by smtp.gmail.com with ESMTPSA id
 h15-20020a02c4cf000000b0040bbcee6b57sm3640013jaj.133.2023.06.07.16.34.33
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jun 2023 16:34:33 -0700 (PDT)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-33dea7d5424so25955ab.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 07 Jun 2023 16:34:33 -0700 (PDT)
X-Received: by 2002:a92:c26d:0:b0:338:9f6a:d54a with SMTP id
 h13-20020a92c26d000000b003389f6ad54amr93121ild.24.1686180872621; Wed, 07 Jun
 2023 16:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230607152432.5435-1-pmladek@suse.com>
 <20230607152432.5435-2-pmladek@suse.com>
In-Reply-To: <20230607152432.5435-2-pmladek@suse.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 7 Jun 2023 16:34:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X4Sp=ZE4DWob-W0NzRm00K7wOWxyyCCaHUHNPPinsjhg@mail.gmail.com>
Message-ID: <CAD=FV=X4Sp=ZE4DWob-W0NzRm00K7wOWxyyCCaHUHNPPinsjhg@mail.gmail.com>
To: Petr Mladek <pmladek@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Wed, Jun 7, 2023 at 8:25 AM Petr Mladek <pmladek@suse.com>
    wrote: > > There are four possible variants of hardlockup detectors: > >
   + buddy: available when SMP is set. > > + perf: available when [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.166.182 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.166.182 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q72fq-00E9qU-7b
Subject: Re: [Kgdb-bugreport] [PATCH 1/7] watchdog/hardlockup: Sort
 hardlockup detector related config values a logical way
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
a0BzdXNlLmNvbT4gd3JvdGU6Cj4KPiBUaGVyZSBhcmUgZm91ciBwb3NzaWJsZSB2YXJpYW50cyBv
ZiBoYXJkbG9ja3VwIGRldGVjdG9yczoKPgo+ICAgKyBidWRkeTogYXZhaWxhYmxlIHdoZW4gU01Q
IGlzIHNldC4KPgo+ICAgKyBwZXJmOiBhdmFpbGFibGUgd2hlbiBIQVZFX0hBUkRMT0NLVVBfREVU
RUNUT1JfUEVSRiBpcyBzZXQuCj4KPiAgICsgYXJjaC1zcGVjaWZpYzogYXZhaWxhYmxlIHdoZW4g
SEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX0FSQ0ggaXMgc2V0Lgo+Cj4gICArIHNwYXJjNjQgc3Bl
Y2lhbCB2YXJpYW50OiBhdmFpbGFibGUgd2hlbiBIQVZFX05NSV9XQVRDSERPRyBpcyBzZXQKPiAg
ICAgICAgIGFuZCBIQVZFX0hBUkRMT0NLVVBfREVURUNUT1JfQVJDSCBpcyBub3Qgc2V0Lgo+Cj4g
T25seSBvbmUgaGFyZGxvY2t1cCBkZXRlY3RvciBjYW4gYmUgY29tcGlsZWQgaW4uIFRoZSBzZWxl
Y3Rpb24gaXMgZG9uZQo+IHVzaW5nIHF1aXRlIGNvbXBsZXggZGVwZW5kZW5jaWVzIGJldHdlZW4g
c2V2ZXJhbCBDT05GSUcgdmFyaWFibGVzLgo+IFRoZSBmb2xsb3dpbmcgcGF0Y2hlcyB3aWxsIHRy
eSB0byBtYWtlIGl0IG1vcmUgc3RyYWlnaHRmb3J3YXJkLgo+Cj4gQXMgYSBmaXJzdCBzdGVwLCBy
ZW9yZGVyIHRoZSBkZWZpbml0aW9ucyBvZiB0aGUgdmFyaW91cyBDT05GSUcgdmFyaWFibGVzLgo+
IFRoZSBsb2dpY2FsIG9yZGVyIGlzOgo+Cj4gICAgMS4gSEFWRV8qIHZhcmlhYmxlcyBkZWZpbmUg
YXZhaWxhYmxlIHZhcmlhbnRzLiBUaGV5IGFyZSB0eXBpY2FsbHkKPiAgICAgICBkZWZpbmVkIGlu
IHRoZSBhcmNoLyBjb25maWcgZmlsZXMuCj4KPiAgICAyLiBIQVJETE9DS1VQX0RFVEVDVE9SIHkv
biB2YXJpYWJsZSBkZWZpbmVzIHdoZXRoZXIgdGhlIGhhcmRsb2NrdXAKPiAgICAgICBkZXRlY3Rv
ciBpcyBlbmFibGVkIGF0IGFsbC4KPgo+ICAgIDMuIEhBUkRMT0NLVVBfREVURUNUT1JfUFJFRkVS
X0JVRERZIHkvbiB2YXJpYWJsZSBkZWZpbmVzIHdoZXRoZXIKPiAgICAgICB0aGUgYnVkZHkgZGV0
ZWN0b3Igc2hvdWxkIGJlIHByZWZlcnJlZCBvdmVyIHRoZSBwZXJmIG9uZS4KPiAgICAgICBOb3Rl
IHRoYXQgdGhlIGFyY2ggc3BlY2lmaWMgdmFyaWFudHMgYXJlIGFsd2F5cyBwcmVmZXJyZWQgd2hl
bgo+ICAgICAgIGF2YWlsYWJsZS4KPgo+ICAgIDQuIEhBUkRMT0NLVVBfREVURUNUT1JfUEVSRi9C
VUREWSB2YXJpYWJsZXMgZGVmaW5lIHdoZXRoZXIgdGhlIGdpdmVuCj4gICAgICAgZGV0ZWN0b3Ig
aXMgZW5hYmxlZCBpbiB0aGUgZW5kLgo+Cj4gICAgNS4gSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9S
X05PTl9BUkNIIGFuZCBIQVJETE9DS1VQX0RFVEVDVE9SX05PTl9BUkNICj4gICAgICAgYXJlIHRl
bXBvcmFyeSB2YXJpYWJsZXMgdGhhdCBhcmUgZ29pbmcgdG8gYmUgcmVtb3ZlZCBpbgo+ICAgICAg
IGEgZm9sbG93dXAgcGF0Y2guCj4KPiBUaGUgcGF0Y2gganVzdCBzaHVmZmxlcyB0aGUgZGVmaW5p
dGlvbnMuIEl0IHNob3VsZCBub3QgY2hhbmdlIHRoZSBleGlzdGluZwo+IGJlaGF2aW9yLgo+Cj4g
U2lnbmVkLW9mZi1ieTogUGV0ciBNbGFkZWsgPHBtbGFkZWtAc3VzZS5jb20+Cj4gLS0tCj4gIGxp
Yi9LY29uZmlnLmRlYnVnIHwgMTEyICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDU2IGluc2VydGlvbnMoKyksIDU2IGRlbGV0
aW9ucygtKQoKSSBkb24ndCByZWFsbHkgaGF2ZSBhbnkgc3Ryb25nIG9waW5pb25zLCBzbyBJJ20g
ZmluZSB3aXRoIHRoaXMuIEluCmdlbmVyYWwgSSB0aGluayB0aGUgb3JkZXJpbmcgSSBwaWNrZWQg
dHJpZWQgdG8gbWF0Y2ggdGhlIGV4aXN0aW5nCiJzdHlsZSIgd2hpY2ggZ2VuZXJhbGx5IHRyaWVk
IHRvIGxpc3QgY29uZmlncyBhbmQgdGhlbiBzZWxlY3QgdGhlbQpiZWxvdy4gVG8gbWUgdGhlIGV4
aXN0aW5nIHN0eWxlIG1ha2VzIG1vcmUgc2Vuc2Ugd2hlbiB0aGlua2luZyBhYm91dAp3cml0aW5n
IEMgY29kZSB3aXRob3V0IGhhdmluZyB0byBwdXQgYSBwaWxlIG9mIHByb3RvdHlwZXMgYXQgdGhl
IHRvcApvZiB5b3VyIGZpbGU6IHlvdSBkZWZpbmUgdGhpbmdzIGhpZ2hlciBpbiB0aGUgZmlsZSBh
bmQgcmVmZXJlbmNlIHRoZW0KYmVsb3cuIEZvciBpbnN0YW5jZSwgdGhlIG9sZCBzdHlsZSAoYmVm
b3JlIGFueSBvZiBteSBwYXRjaGVzKSBoYWQ6Cgpjb25maWcgU09GVExPQ0tVUF9ERVRFQ1RPUjoK
ICAuLi4gYmxhaCBibGFoIGJsYWggLi4uCgpjb25maWcgSEFSRExPQ0tVUF9ERVRFQ1RPUl9QRVJG
OgogIHNlbGVjdCBTT0ZUTE9DS1VQX0RFVEVDVE9SCgpjb25maWcgSEFSRExPQ0tVUF9ERVRFQ1RP
UjoKICAuLi4gYmxhaCBibGFoIGJsYWggLi4uCiAgc2VsZWN0IExPQ0tVUF9ERVRFQ1RPUgogIHNl
bGVjdCBIQVJETE9DS1VQX0RFVEVDVE9SX1BFUkYgaWYgSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9S
X1BFUkYKCllvdXIgbmV3IHN0eWxlIHNlZW1zIHRvIGJlIHRoZSBvcHBvc2l0ZSBvZiB0aGF0LgoK
LURvdWcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpL
Z2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGIt
YnVncmVwb3J0Cg==
