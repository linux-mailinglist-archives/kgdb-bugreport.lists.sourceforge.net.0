Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A530973372D
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 16 Jun 2023 19:10:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qACxT-00019T-Jv
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 16 Jun 2023 17:10:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qACxS-00019N-EW
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 16 Jun 2023 17:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RlH6N4BeYWriIEzthku3f2s3TDY9tC006RTYxc81VbY=; b=bTqFO5HWH55Lo0bPz45oO8hDrc
 MSRSHPRGThEzvwWCOZJ7IihT0ljwrBg2DuuSkC/ibyeG5ZTB2xMYg+NONCDzP8ZrXMC4bf38kqQMd
 rR55B2ahJpA8jTQNTus8F+EOz81ZOnuMDRdz8e7hiTUx98U9PgxwHvEEaK2g7j5e/F6A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RlH6N4BeYWriIEzthku3f2s3TDY9tC006RTYxc81VbY=; b=MUwKQlkwUzgZTfuvKcJpqQDYgy
 rwvfLhOx9METrNzjSVeYbI6DVKm4JqN9VQVb5SjpcSb+wL7wo8db6PrdQ3swXEz2pnOsErNAn+QV3
 XaCbEBSa0Y4DGdlDuZ4h7P1KKNGSUl/z1/ujNHU5GgY62iC7lDpDxs3IIentApz94MVc=;
Received: from mail-ed1-f50.google.com ([209.85.208.50])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qACxN-0063pF-Rr for kgdb-bugreport@lists.sourceforge.net;
 Fri, 16 Jun 2023 17:09:59 +0000
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-51a2fa4a45eso1201240a12.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 16 Jun 2023 10:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686935385; x=1689527385;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RlH6N4BeYWriIEzthku3f2s3TDY9tC006RTYxc81VbY=;
 b=DpRGh5L4DZO0G3MQMESWZr/zmYeCrJlI3KwNFUQDHC9I1G3kxui98TCIVe41FS70Tz
 Ghog+h9ZMDHGORN8I9/MrfXff6J9I+sJ3xPlan8HhF1oR295l/89WYwRWIEXy1j5Xzd0
 kxUE386rWnZ+hstF/pcCW3JD9CrM1NPnmzpZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686935385; x=1689527385;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RlH6N4BeYWriIEzthku3f2s3TDY9tC006RTYxc81VbY=;
 b=l7nM9yt1y7mJ3JyHdHRi1vDFnIyg380YlrWoiahgUn0Il4oWPzuwy4z946EdzwNHq/
 6Ynk/0+SM39r+G9AvqexMWzzSrLdmHMrwyNo7PlNtvHH3cHbg1vPv+mcClnr5gvfeUYe
 EjDI0npw2ebktePYvJMS8aCjYFgtpGkxtZ6t3R5a2io8prThWRyXjupX3pcR4M5GNQbq
 dAvI66GZ/JuRhAzn0th5rPNOm+pWVkbheeFKW9syw4yaEMIUJWklMXOUmxIY0Zk5gz1l
 QwlZ6Z3KMBz+gEAgKY1jK6wq+tbnwoGRONplKsCCc1Sy77fzlNCq+nL8W9QTZZuzQKhE
 /iAw==
X-Gm-Message-State: AC+VfDy5GCzvNZCuBvZObf4v7hKf2LEQjM4gi0SMpAprnu/YnrfIlvAx
 wCUR9ZGTD7AhOre1W9K4t1l9yIr0zFiugQlIu+/FDG/p
X-Google-Smtp-Source: ACHHUZ7XSyqqbGJc2rsLj9zh8c279XD30kkOe20LrdxeSGqFMgsohZPQlVWCrxbfC24D6PAfSKAhEw==
X-Received: by 2002:a17:906:da83:b0:982:ab8d:1e08 with SMTP id
 xh3-20020a170906da8300b00982ab8d1e08mr2625715ejb.59.1686933855772; 
 Fri, 16 Jun 2023 09:44:15 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44]) by smtp.gmail.com with ESMTPSA id
 z6-20020a1709060ac600b009745ecf5438sm10914952ejf.193.2023.06.16.09.44.15
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jun 2023 09:44:15 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-51400fa347dso115a12.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 16 Jun 2023 09:44:15 -0700 (PDT)
X-Received: by 2002:a50:bac3:0:b0:506:b280:4993 with SMTP id
 x61-20020a50bac3000000b00506b2804993mr233742ede.2.1686933854748; Fri, 16 Jun
 2023 09:44:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230616150618.6073-1-pmladek@suse.com>
 <20230616150618.6073-2-pmladek@suse.com>
In-Reply-To: <20230616150618.6073-2-pmladek@suse.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 16 Jun 2023 09:44:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XUWnjCAjZKb5wYcGhC=T8+hoUr+1junoH5ognge1aZHg@mail.gmail.com>
Message-ID: <CAD=FV=XUWnjCAjZKb5wYcGhC=T8+hoUr+1junoH5ognge1aZHg@mail.gmail.com>
To: Petr Mladek <pmladek@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Fri, Jun 16, 2023 at 8:06 AM Petr Mladek <pmladek@suse.com>
    wrote: > > There are four possible variants of hardlockup detectors: > >
   + buddy: available when SMP is set. > > + perf: available when [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.50 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.50 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qACxN-0063pF-Rr
Subject: Re: [Kgdb-bugreport] [PATCH v2 1/6] watchdog/hardlockup: Sort
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

SGksCgpPbiBGcmksIEp1biAxNiwgMjAyMyBhdCA4OjA24oCvQU0gUGV0ciBNbGFkZWsgPHBtbGFk
ZWtAc3VzZS5jb20+IHdyb3RlOgo+Cj4gVGhlcmUgYXJlIGZvdXIgcG9zc2libGUgdmFyaWFudHMg
b2YgaGFyZGxvY2t1cCBkZXRlY3RvcnM6Cj4KPiAgICsgYnVkZHk6IGF2YWlsYWJsZSB3aGVuIFNN
UCBpcyBzZXQuCj4KPiAgICsgcGVyZjogYXZhaWxhYmxlIHdoZW4gSEFWRV9IQVJETE9DS1VQX0RF
VEVDVE9SX1BFUkYgaXMgc2V0Lgo+Cj4gICArIGFyY2gtc3BlY2lmaWM6IGF2YWlsYWJsZSB3aGVu
IEhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9BUkNIIGlzIHNldC4KPgo+ICAgKyBzcGFyYzY0IHNw
ZWNpYWwgdmFyaWFudDogYXZhaWxhYmxlIHdoZW4gSEFWRV9OTUlfV0FUQ0hET0cgaXMgc2V0Cj4g
ICAgICAgICBhbmQgSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX0FSQ0ggaXMgbm90IHNldC4KPgo+
IE9ubHkgb25lIGhhcmRsb2NrdXAgZGV0ZWN0b3IgY2FuIGJlIGNvbXBpbGVkIGluLiBUaGUgc2Vs
ZWN0aW9uIGlzIGRvbmUKPiB1c2luZyBxdWl0ZSBjb21wbGV4IGRlcGVuZGVuY2llcyBiZXR3ZWVu
IHNldmVyYWwgQ09ORklHIHZhcmlhYmxlcy4KPiBUaGUgZm9sbG93aW5nIHBhdGNoZXMgd2lsbCB0
cnkgdG8gbWFrZSBpdCBtb3JlIHN0cmFpZ2h0Zm9yd2FyZC4KPgo+IEFzIGEgZmlyc3Qgc3RlcCwg
cmVvcmRlciB0aGUgZGVmaW5pdGlvbnMgb2YgdGhlIHZhcmlvdXMgQ09ORklHIHZhcmlhYmxlcy4K
PiBUaGUgbG9naWNhbCBvcmRlciBpczoKPgo+ICAgIDEuIEhBVkVfKiB2YXJpYWJsZXMgZGVmaW5l
IGF2YWlsYWJsZSB2YXJpYW50cy4gVGhleSBhcmUgdHlwaWNhbGx5Cj4gICAgICAgZGVmaW5lZCBp
biB0aGUgYXJjaC8gY29uZmlnIGZpbGVzLgo+Cj4gICAgMi4gSEFSRExPQ0tVUF9ERVRFQ1RPUiB5
L24gdmFyaWFibGUgZGVmaW5lcyB3aGV0aGVyIHRoZSBoYXJkbG9ja3VwCj4gICAgICAgZGV0ZWN0
b3IgaXMgZW5hYmxlZCBhdCBhbGwuCj4KPiAgICAzLiBIQVJETE9DS1VQX0RFVEVDVE9SX1BSRUZF
Ul9CVUREWSB5L24gdmFyaWFibGUgZGVmaW5lcyB3aGV0aGVyCj4gICAgICAgdGhlIGJ1ZGR5IGRl
dGVjdG9yIHNob3VsZCBiZSBwcmVmZXJyZWQgb3ZlciB0aGUgcGVyZiBvbmUuCj4gICAgICAgTm90
ZSB0aGF0IHRoZSBhcmNoIHNwZWNpZmljIHZhcmlhbnRzIGFyZSBhbHdheXMgcHJlZmVycmVkIHdo
ZW4KPiAgICAgICBhdmFpbGFibGUuCj4KPiAgICA0LiBIQVJETE9DS1VQX0RFVEVDVE9SX1BFUkYv
QlVERFkgdmFyaWFibGVzIGRlZmluZSB3aGV0aGVyIHRoZSBnaXZlbgo+ICAgICAgIGRldGVjdG9y
IGlzIGVuYWJsZWQgaW4gdGhlIGVuZC4KPgo+ICAgIDUuIEhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RP
Ul9OT05fQVJDSCBhbmQgSEFSRExPQ0tVUF9ERVRFQ1RPUl9OT05fQVJDSAo+ICAgICAgIGFyZSB0
ZW1wb3JhcnkgdmFyaWFibGVzIHRoYXQgYXJlIGdvaW5nIHRvIGJlIHJlbW92ZWQgaW4KPiAgICAg
ICBhIGZvbGxvd3VwIHBhdGNoLgo+Cj4gVGhpcyBpcyBhIHByZXBhcmF0aW9uIHN0ZXAgZm9yIGZ1
cnRoZXIgY2xlYW51cC4gSXQgd2lsbCBjaGFuZ2UgdGhlIGxvZ2ljCj4gd2l0aG91dCBzaHVmZmxp
bmcgdGhlIGRlZmluaXRpb25zLgo+Cj4gVGhpcyBjaGFuZ2UgdGVtcG9yYXJ5IGJyZWFrcyB0aGUg
Qy1saWtlIG9yZGVyaW5nIHdoZXJlIHRoZSB2YXJpYWJsZXMgYXJlCj4gZGVjbGFyZWQgb3IgZGVm
aW5lZCBiZWZvcmUgdGhleSBhcmUgdXNlZC4gSXQgaXMgbm90IHJlYWxseSBuZWVkZWQgZm9yCj4g
S2NvbmZpZy4gQWxzbyB0aGUgZm9sbG93aW5nIHBhdGNoZXMgd2lsbCByZXdvcmsgdGhlIGxvZ2lj
IHNvIHRoYXQKPiB0aGUgb3JkZXJpbmcgd2lsbCBiZSBDLWxpa2UgaW4gdGhlIGVuZC4KPgo+IFRo
ZSBwYXRjaCBqdXN0IHNodWZmbGVzIHRoZSBkZWZpbml0aW9ucy4gSXQgc2hvdWxkIG5vdCBjaGFu
Z2UgdGhlIGV4aXN0aW5nCj4gYmVoYXZpb3IuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQZXRyIE1sYWRl
ayA8cG1sYWRla0BzdXNlLmNvbT4KPiAtLS0KPiAgbGliL0tjb25maWcuZGVidWcgfCAxMTIgKysr
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgNTYgaW5zZXJ0aW9ucygrKSwgNTYgZGVsZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogRG91
Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlz
dApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
