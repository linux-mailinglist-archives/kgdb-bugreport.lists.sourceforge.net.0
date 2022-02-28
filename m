Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA6C4C796C
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 28 Feb 2022 21:04:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nOmFr-0003mz-Mr
	for lists+kgdb-bugreport@lfdr.de; Mon, 28 Feb 2022 20:04:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <torvalds@linuxfoundation.org>) id 1nOmFq-0003mr-OD
 for kgdb-bugreport@lists.sourceforge.net; Mon, 28 Feb 2022 20:04:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gT/mxIYbzDn15+z84Rt0/ZmLFqIl34ZjMPCseIzUB9o=; b=hyZ06EWLS8IUWA+zrQXxXLSWCE
 nVb2+f+jLfYqld54dH7AfoPPB7hkk9rv7tj2xwVkM2vp2tEqT15B6Qw+hqzy9W8yaSM6EGYPbVYr1
 VDOb8grVD6+tGsYM/sCLLStj/U+CmhTjIrjtQcFcq3diPt73L7/ARkw7hpH030Q6G3kA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gT/mxIYbzDn15+z84Rt0/ZmLFqIl34ZjMPCseIzUB9o=; b=V2hObP7FcOkPFNCyoKL+WhGHxg
 /L9wSuII+pHAqbbnNKg64bIdqgfZRyEZ/P6Snf9sEgKsQbY7w3iXakZw54UZjJQ0dQFj3BIRWcATn
 f4AFEHKbVT1AL1XBAk0LZdAAno7XRNubSgg3YNK0FtrVJwShR/rehBB85y7WrfX59M0M=;
Received: from mail-lf1-f43.google.com ([209.85.167.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nOmFo-00034G-PA
 for kgdb-bugreport@lists.sourceforge.net; Mon, 28 Feb 2022 20:04:21 +0000
Received: by mail-lf1-f43.google.com with SMTP id j7so23283717lfu.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 28 Feb 2022 12:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gT/mxIYbzDn15+z84Rt0/ZmLFqIl34ZjMPCseIzUB9o=;
 b=Tm2RrZZp9rg85Q2lAdsba4a3IH+hQMy5xZCbUizCCXmPzyfZ+2VRqEslWXZB4tPt3B
 Xz8lYe63CHEdQCuWSaPC9nNMhFWrnR54Ihwd0u2qPZVZ4zvhHacXKCw+SJS4BR1PfT62
 xCFGBc0xrmrOEo0QPHvZeTHUhXNuWYmty+udI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gT/mxIYbzDn15+z84Rt0/ZmLFqIl34ZjMPCseIzUB9o=;
 b=lNIlTyh0N23IXapd18g/JTz1Ij14TAZZCWvErev5EqSsrRomsWwsjjLLINelcjyvcv
 kHmDwbIORmENQVmY2UoEY4zIdjnGw1KLLPZnU1A5fGpRp9KEPvJm/fw/ZqUoz7Q4vjhj
 N79nH/TGevpG16akLh6y3eqf5AZpuKPMx9RZBnTKZ3YWjutCTG1S2bTZnGWr8e0FQ9bA
 mNv3yle/MZZLMoEF0zuV+IHv1n0n4mrVzy+eiZJHqXCObuqf6f4s1Sqbhp0D1Jl085kI
 ImL87EFuzlAqQr2qtXwozhP7GzsgHC2gQHoKVnmVV7YNIDyo7RHSqlBGkX+gDyDj1Pke
 0plA==
X-Gm-Message-State: AOAM531SqABoQgnLR/OD0kzrz+bIDtoEO93qDkq++yr0DPfyOHzAPYKZ
 jy7fNojM2aAWXsdwy8gyQWwPK0o2ez9n29L1EW8=
X-Google-Smtp-Source: ABdhPJw/eF4h/KG+r4X0jms54QgwpgfWR63wBP2r6+vrcASxz7lh0K9mL+9Kp4PCdDHV8vGgfBR4BQ==
X-Received: by 2002:a05:6512:3710:b0:43a:12aa:cb68 with SMTP id
 z16-20020a056512371000b0043a12aacb68mr13866779lfr.280.1646078653956; 
 Mon, 28 Feb 2022 12:04:13 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47]) by smtp.gmail.com with ESMTPSA id
 t10-20020a19ad0a000000b00443d203833csm1111235lfc.122.2022.02.28.12.04.13
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 12:04:13 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id t13so11281474lfd.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 28 Feb 2022 12:04:13 -0800 (PST)
X-Received: by 2002:ac2:5313:0:b0:443:99c1:7e89 with SMTP id
 c19-20020ac25313000000b0044399c17e89mr13183568lfh.531.1646078183366; Mon, 28
 Feb 2022 11:56:23 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
In-Reply-To: <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Feb 2022 11:56:07 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
Message-ID: <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Feb 28, 2022 at 4:19 AM Christian König <christian.koenig@amd.com>
    wrote: > > I don't think that using the extra variable makes the code in
   any way > more reliable or easier to read. So I think the next step is to
   do the attached patch (which requires that "-std=gnu11" that was discussed
    in the original thread). 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
                             mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.43 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.43 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nOmFo-00034G-PA
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Kgdb-bugreport] [PATCH 2/6] treewide: remove using list
 iterator after loop body as a ptr
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 alsa-devel@alsa-project.org, KVM list <kvm@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, dma <dmaengine@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, v9fs-developer@lists.sourceforge.net,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sgx@vger.kernel.org,
 linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org, samba-technical@lists.samba.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 tipc-discussion@lists.sourceforge.net,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gTW9uLCBGZWIgMjgsIDIwMjIgYXQgNDoxOSBBTSBDaHJpc3RpYW4gS8O2bmlnCjxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Cj4gSSBkb24ndCB0aGluayB0aGF0IHVzaW5nIHRo
ZSBleHRyYSB2YXJpYWJsZSBtYWtlcyB0aGUgY29kZSBpbiBhbnkgd2F5Cj4gbW9yZSByZWxpYWJs
ZSBvciBlYXNpZXIgdG8gcmVhZC4KClNvIEkgdGhpbmsgdGhlIG5leHQgc3RlcCBpcyB0byBkbyB0
aGUgYXR0YWNoZWQgcGF0Y2ggKHdoaWNoIHJlcXVpcmVzCnRoYXQgIi1zdGQ9Z251MTEiIHRoYXQg
d2FzIGRpc2N1c3NlZCBpbiB0aGUgb3JpZ2luYWwgdGhyZWFkKS4KClRoYXQgd2lsbCBndWFyYW50
ZWUgdGhhdCB0aGUgJ3BvcycgcGFyYW1ldGVyIG9mIGxpc3RfZm9yX2VhY2hfZW50cnkoKQppcyBv
bmx5IHVwZGF0ZWQgSU5TSURFIHRoZSBmb3JfZWFjaF9saXN0X2VudHJ5KCkgbG9vcCwgYW5kIGNh
biBuZXZlcgpwb2ludCB0byB0aGUgKHdyb25nbHkgdHlwZWQpIGhlYWQgZW50cnkuCgpBbmQgSSB3
b3VsZCBhY3R1YWxseSBob3BlIHRoYXQgaXQgc2hvdWxkIGFjdHVhbGx5IGNhdXNlIGNvbXBpbGVy
Cndhcm5pbmdzIGFib3V0IHBvc3NpYmx5IHVuaW5pdGlhbGl6ZWQgdmFyaWFibGVzIGlmIHBlb3Bs
ZSB0aGVuIHVzZSB0aGUKJ3BvcycgcG9pbnRlciBvdXRzaWRlIHRoZSBsb29wLiBFeGNlcHQKCiAo
YSkgdGhhdCBjb2RlIGluIHNneC9lbmNsLmMgY3VycmVudGx5IGluaXRpYWxpemVzICd0bXAnIHRv
IE5VTEwgZm9yCmluZXhwbGljYWJsZSByZWFzb25zIC0gcG9zc2libHkgYmVjYXVzZSBpdCBhbHJl
YWR5IGV4cGVjdGVkIHRoaXMKYmVoYXZpb3IKCiAoYikgd2hlbiBJIHJlbW92ZSB0aGF0IE5VTEwg
aW5pdGlhbGl6ZXIsIEkgc3RpbGwgZG9uJ3QgZ2V0IGEgd2FybmluZywKYmVjYXVzZSB3ZSd2ZSBk
aXNhYmxlZCAtV25vLW1heWJlLXVuaW5pdGlhbGl6ZWQgc2luY2UgaXQgcmVzdWx0cyBpbiBzbwpt
YW55IGZhbHNlIHBvc2l0aXZlcy4KCk9oIHdlbGwuCgpBbnl3YXksIGdpdmUgdGhpcyBwYXRjaCBh
IGxvb2ssIGFuZCBhdCBsZWFzdCBpZiBpdCdzIGV4cGFuZGVkIHRvIGRvCiIocG9zKSA9IE5VTEwi
IGluIHRoZSBlbnRyeSBzdGF0ZW1lbnQgZm9yIHRoZSBmb3ItbG9vcCwgaXQgd2lsbCBhdm9pZAp0
aGUgSEVBRCB0eXBlIGNvbmZ1c2lvbiB0aGF0IEpha29iIGlzIHdvcmtpbmcgb24uIEFuZCBJIHRo
aW5rIGluIGEKY2xlYW5lciB3YXkgdGhhbiB0aGUgaG9ycmlkIGdhbWVzIGhlIHBsYXlzLgoKKEJ1
dCBpdCB3b24ndCBhdm9pZCBwb3NzaWJsZSBDUFUgc3BlY3VsYXRpb24gb2Ygc3VjaCB0eXBlIGNv
bmZ1c2lvbi4KVGhhdCwgaW4gbXkgb3BpbmlvbiwgaXMgYSBjb21wbGV0ZWx5IGRpZmZlcmVudCBp
c3N1ZSkKCkkgZG8gd2lzaCB3ZSBjb3VsZCBhY3R1YWxseSBwb2lzb24gdGhlICdwb3MnIHZhbHVl
IGFmdGVyIHRoZSBsb29wCnNvbWVob3cgLSBidXQgY2xlYXJseSB0aGUgIm1pZ2h0IGJlIHVuaW5p
dGlhbGl6ZWQiIEkgd2FzIGhvcGluZyBmb3IKaXNuJ3QgdGhlIHdheSB0byBkbyBpdC4KCkFueWJv
ZHkgaGF2ZSBhbnkgaWRlYXM/CgogICAgICAgICAgICAgICAgTGludXMKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcg
bGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
