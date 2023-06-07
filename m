Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C85727311
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  8 Jun 2023 01:35:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q72gh-00084X-GI
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 07 Jun 2023 23:35:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q72gf-00084Q-5O
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 07 Jun 2023 23:35:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=biTF71f0vAcJJkYigTXNuEEy/3xCIdh35a2WB5hJK3w=; b=MJY/psNz4we4kqblBqYo0Yy0WU
 ExREX/jPi45sEolvMXwCxqfycHwyq7d/g/l8FXPRIU/3KF4jn199ybIVNYk5u1IwUUp8NtO31dn3J
 nshlaPuYj1GLvPqUGrCwrNfkoqTHb1uLGNR6zK7Jb7Qxp0+HVnvCmLGdBDHt2CNP8jns=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=biTF71f0vAcJJkYigTXNuEEy/3xCIdh35a2WB5hJK3w=; b=jSiSGdI9nGKU81rUkYSblL/QP0
 lPMtvUrSu1T06pqWLjcJY0k8AsT2ffJDAjGyFTrfC/bspZ9PIGGraAKAnQelr1fQnA0l9fHuKWTqm
 A/csWgBcQyN2p+NfH4d9dpa0+RjPF9rLw0DKj9nbe6bYKDvjOpG1ZIJATG/wfh9UCVYw=;
Received: from mail-il1-f177.google.com ([209.85.166.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q72gd-0001uI-87 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 07 Jun 2023 23:35:33 +0000
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-33b36a9fdf8so8852455ab.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 07 Jun 2023 16:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686180923; x=1688772923;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=biTF71f0vAcJJkYigTXNuEEy/3xCIdh35a2WB5hJK3w=;
 b=cDd+huO6yiwjdUNKLZXT1W+AqRcPQSvEqge36+d9FgGW3jIk7SHGJctxAb9YVM1Ir+
 FkTiBJw1Sij/UzxFy9XlYMPCkAu/Qq5AH8vuftnbuox0hONovc6Zvxwsh/nkCQmgUjrI
 Rej4cdv23ACAsd3VSLMLwZ68en6at1YE+ugOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686180923; x=1688772923;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=biTF71f0vAcJJkYigTXNuEEy/3xCIdh35a2WB5hJK3w=;
 b=iA2cLwdYiaUqtY2cFinrUJTKqw2aTVmXELEs4dbUVoXX4qMJrwRGhVmy2syNMrKGV3
 IsDmhBo9KYjF5yfCcNiV22V2KhIMrP2X3C/kCsJ96V2Ra6Lh7wL+PznMAjG1ijCf8JOy
 rXYzA/prT8OcpL2ZMoNxVtpnRP+jTxw6X27HulTdhmcoixlLcKRsLJTcItIDnenqGY5G
 /HM+gNz5PHM5ADa6yAriZ0sP4b2J1PT75M/BrIdhIp4+4E7/AgzxCaIrMlnWYIDtxoLa
 3hhdzmZmoEeH0dimqPOjRICBt+q1LcKkIpvKo9TtcPmD8Ih/LjsZ0lOKozXwZTkedmqI
 s/TQ==
X-Gm-Message-State: AC+VfDzPtTl99IrQdxXmS/WnbC4o9mtquOajlS4eBo92dtIaR+dlbNTI
 0i7ufxmd4GLGvGPbILiaPiiAIEMSKwujNkKGQ+0=
X-Google-Smtp-Source: ACHHUZ5EaVNFr/3nuRKeTUQJ87TX157eNyRfV/ACB/BEbGD9/uVP/hX3IfA+07WTHxYwTTGHP0XnVA==
X-Received: by 2002:a05:6e02:810:b0:33b:1da8:a7d0 with SMTP id
 u16-20020a056e02081000b0033b1da8a7d0mr8717076ilm.29.1686180923347; 
 Wed, 07 Jun 2023 16:35:23 -0700 (PDT)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com.
 [209.85.166.176]) by smtp.gmail.com with ESMTPSA id
 ee23-20020a056638293700b00420983d5b8dsm1354771jab.103.2023.06.07.16.35.21
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jun 2023 16:35:22 -0700 (PDT)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-33bf12b5fb5so26115ab.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 07 Jun 2023 16:35:21 -0700 (PDT)
X-Received: by 2002:a05:6e02:170e:b0:33d:5640:f315 with SMTP id
 u14-20020a056e02170e00b0033d5640f315mr16394ill.25.1686180921009; Wed, 07 Jun
 2023 16:35:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230607152432.5435-1-pmladek@suse.com>
 <20230607152432.5435-3-pmladek@suse.com>
In-Reply-To: <20230607152432.5435-3-pmladek@suse.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 7 Jun 2023 16:35:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WRzaLbLQ65usGeFq3ya=DV8cYyHQina_721EFoSTdBGA@mail.gmail.com>
Message-ID: <CAD=FV=WRzaLbLQ65usGeFq3ya=DV8cYyHQina_721EFoSTdBGA@mail.gmail.com>
To: Petr Mladek <pmladek@suse.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Wed, Jun 7, 2023 at 8:25 AM Petr Mladek <pmladek@suse.com>
    wrote: > > diff --git a/arch/Kconfig b/arch/Kconfig > index 422f0ffa269e..13c6e596cf9e
    100644 > --- a/arch/Kconfig > +++ b/arch/Kconfig [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.166.177 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.166.177 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q72gd-0001uI-87
Subject: Re: [Kgdb-bugreport] [PATCH 2/7] watchdog/hardlockup: Make the
 config checks more straightforward
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
a0BzdXNlLmNvbT4gd3JvdGU6Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9LY29uZmlnIGIvYXJjaC9L
Y29uZmlnCj4gaW5kZXggNDIyZjBmZmEyNjllLi4xM2M2ZTU5NmNmOWUgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9LY29uZmlnCj4gKysrIGIvYXJjaC9LY29uZmlnCj4gQEAgLTQwNCwxNyArNDA0LDI3IEBA
IGNvbmZpZyBIQVZFX05NSV9XQVRDSERPRwo+ICAgICAgICAgZGVwZW5kcyBvbiBIQVZFX05NSQo+
ICAgICAgICAgYm9vbAo+ICAgICAgICAgaGVscAo+IC0gICAgICAgICBUaGUgYXJjaCBwcm92aWRl
cyBhIGxvdyBsZXZlbCBOTUkgd2F0Y2hkb2cuIEl0IHByb3ZpZGVzCj4gLSAgICAgICAgIGFzbS9u
bWkuaCwgYW5kIGRlZmluZXMgaXRzIG93biB3YXRjaGRvZ19oYXJkbG9ja3VwX3Byb2JlKCkgYW5k
Cj4gLSAgICAgICAgIGFyY2hfdG91Y2hfbm1pX3dhdGNoZG9nKCkuCj4gKyAgICAgICAgIFRoZSBh
cmNoIHByb3ZpZGVzIGl0cyBvd24gaGFyZGxvY2t1cCBkZXRlY3RvciBpbXBsZW1lbnRhdGlvbiBp
bnN0ZWFkCj4gKyAgICAgICAgIG9mIHRoZSBnZW5lcmljIHBlcmYgb25lLgoKbml0OiBkaWQgeW91
IG1lYW4gdG8gaGF2ZSBkaWZmZXJlbnQgd29yZGluZyBoZXJlIGNvbXBhcmVkIHRvCkhBVkVfSEFS
RExPQ0tVUF9ERVRFQ1RPUl9BUkNIPyBIZXJlIHlvdSBzYXkgInRoZSBnZW5lcmljIHBlcmYgb25l
IiBhbmQKdGhlcmUgeW91IHNheSAidGhlIGdlbmVyaWMgb25lcyIsIHRob3VnaCBpdCBzZWVtcyBs
aWtlIHlvdSBtZWFuIHRoZW0KdG8gYmUgdGhlIHNhbWUuCgo+ICsKPiArICAgICAgICAgU3BhcmM2
NCBkZWZpbmVzIHRoaXMgdmFyaWFibGUgd2l0aG91dCBIQVZFX0hBUkRMT0NLVVBfREVURUNUT1Jf
QVJDSC4KPiArICAgICAgICAgSXQgZG9lcyBfbm90XyB1c2UgdGhlIGNvbW1hbmQgbGluZSBwYXJh
bWV0ZXJzIGFuZCBzeXNjdGwgaW50ZXJmYWNlCj4gKyAgICAgICAgIHVzZWQgYnkgZ2VuZXJpYyBo
YXJkbG9ja3VwIGRldGVjdG9ycy4gSW5zdGVhZCBpdCBpcyBlbmFibGVkL2Rpc2FibGVkCj4gKyAg
ICAgICAgIGJ5IHRoZSB0b3AtbGV2ZWwgd2F0Y2hkb2cgaW50ZXJmYWNlIHRoYXQgaXMgY29tbW9u
IGZvciBib3RoIHNvZnRsb2NrdXAKPiArICAgICAgICAgYW5kIGhhcmRsb2NrdXAgZGV0ZWN0b3Jz
Lgo+Cj4gIGNvbmZpZyBIQVZFX0hBUkRMT0NLVVBfREVURUNUT1JfQVJDSAo+ICAgICAgICAgYm9v
bAo+ICAgICAgICAgc2VsZWN0IEhBVkVfTk1JX1dBVENIRE9HCj4gICAgICAgICBoZWxwCj4gLSAg
ICAgICAgIFRoZSBhcmNoIGNob29zZXMgdG8gcHJvdmlkZSBpdHMgb3duIGhhcmRsb2NrdXAgZGV0
ZWN0b3IsIHdoaWNoIGlzCj4gLSAgICAgICAgIGEgc3VwZXJzZXQgb2YgdGhlIEhBVkVfTk1JX1dB
VENIRE9HLiBJdCBhbHNvIGNvbmZvcm1zIHRvIGNvbmZpZwo+IC0gICAgICAgICBpbnRlcmZhY2Vz
IGFuZCBwYXJhbWV0ZXJzIHByb3ZpZGVkIGJ5IGhhcmRsb2NrdXAgZGV0ZWN0b3Igc3Vic3lzdGVt
Lgo+ICsgICAgICAgICBUaGUgYXJjaCBwcm92aWRlcyBpdHMgb3duIGhhcmRsb2NrdXAgZGV0ZWN0
b3IgaW1wbGVtZW50YXRpb24gaW5zdGVhZAo+ICsgICAgICAgICBvZiB0aGUgZ2VuZXJpYyBvbmVz
Lgo+ICsKPiArICAgICAgICAgSXQgdXNlcyB0aGUgc2FtZSBjb21tYW5kIGxpbmUgcGFyYW1ldGVy
cywgYW5kIHN5c2N0bCBpbnRlcmZhY2UsCj4gKyAgICAgICAgIGFzIHRoZSBnZW5lcmljIGhhcmRs
b2NrdXAgZGV0ZWN0b3JzLgo+ICsKPiArICAgICAgICAgSEFWRV9OTUlfV0FUQ0hET0cgaXMgc2Vs
ZWN0ZWQgdG8gYnVpbGQgdGhlIGNvZGUgc2hhcmVkIHdpdGgKPiArICAgICAgICAgdGhlIHNwYXJj
NjQgc3BlY2lmaWMgaW1wbGVtZW50YXRpb24uCj4KPiAgY29uZmlnIEhBVkVfUEVSRl9SRUdTCj4g
ICAgICAgICBib29sCj4gZGlmZiAtLWdpdCBhL2xpYi9LY29uZmlnLmRlYnVnIGIvbGliL0tjb25m
aWcuZGVidWcKPiBpbmRleCAzZTkxZmEzM2M3YTAuLmQyMDFmNWQzODc2YiAxMDA2NDQKPiAtLS0g
YS9saWIvS2NvbmZpZy5kZWJ1Zwo+ICsrKyBiL2xpYi9LY29uZmlnLmRlYnVnCj4gQEAgLTEwMzUs
MTYgKzEwMzUsMzMgQEAgY29uZmlnIEJPT1RQQVJBTV9TT0ZUTE9DS1VQX1BBTklDCj4KPiAgICAg
ICAgICAgU2F5IE4gaWYgdW5zdXJlLgo+Cj4gK2NvbmZpZyBIQVZFX0hBUkRMT0NLVVBfREVURUNU
T1JfQlVERFkKPiArICAgICAgIGJvb2wKPiArICAgICAgIGRlcGVuZHMgb24gU01QCj4gKyAgICAg
ICBkZWZhdWx0IHkKCkkgdGhpbmsgeW91IHNpbXBsaWZ5IHlvdXIgbGlmZSBpZiB5b3UgYWxzbyBh
ZGQ6CgogIGRlcGVuZHMgb24gIUhBVkVfTk1JX1dBVENIRE9HCgpUaGUgZXhpc3RpbmcgY29uZmln
IHN5c3RlbSBoYXMgYWx3YXlzIGFzc3VtZWQgdGhhdCBubyBhcmNoaXRlY3R1cmUKZGVmaW5lcyBi
b3RoIEhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9QRVJGIGFuZCBIQVZFX05NSV9XQVRDSERPRwoo
c3ltYm9scyB3b3VsZCBoYXZlIGNsYXNoZWQgYW5kIHlvdSB3b3VsZCBnZXQgYSBsaW5rIGVycm9y
IGFzIHR3bwp3YXRjaGRvZ3MgdHJ5IHRvIGltcGxlbWVudCB0aGUgc2FtZSB3ZWFrIHN5bWJvbCku
IElmIHlvdSBhZGQgdGhlIGV4dHJhCmRlcGVuZGVuY3kgdG8gImJ1ZGR5IiBhcyBwZXIgYWJvdmUs
IHRoZW4gYSBmZXcgdGhpbmdzIGJlbG93IGZhbGwgb3V0LgpJJ2xsIHRyeSB0byBwb2ludCB0aGVt
IG91dCBiZWxvdy4KCgo+ICsKPiAgIwo+IC0jIGFyY2gvIGNhbiBkZWZpbmUgSEFWRV9IQVJETE9D
S1VQX0RFVEVDVE9SX0FSQ0ggdG8gcHJvdmlkZSB0aGVpciBvd24gaGFyZAo+IC0jIGxvY2t1cCBk
ZXRlY3RvciByYXRoZXIgdGhhbiB0aGUgcGVyZiBiYXNlZCBkZXRlY3Rvci4KPiArIyBHbG9iYWwg
c3dpdGNoIHdoZXRoZXIgdG8gYnVpbGQgYSBoYXJkbG9ja3VwIGRldGVjdG9yIGF0IGFsbC4gSXQg
aXMgYXZhaWxhYmxlCj4gKyMgb25seSB3aGVuIHRoZSBhcmNoaXRlY3R1cmUgc3VwcG9ydHMgYXQg
bGVhc3Qgb25lIGltcGxlbWVudGF0aW9uLiBUaGVyZSBhcmUKPiArIyB0d28gZXhjZXB0aW9ucy4g
VGhlIGhhcmRsb2NrdXAgZGV0ZWN0b3IgaXMgbmV3ZXIgZW5hYmxlZCBvbjoKCnMvbmV3ZXIvbmV2
ZXIvCgoKPiArIwo+ICsjICAgICAgczM5MDogaXQgcmVwb3J0ZWQgbWFueSBmYWxzZSBwb3NpdGl2
ZXMgdGhlcmUKPiArIwo+ICsjICAgICAgc3BhcmM2NDogaGFzIGEgY3VzdG9tIGltcGxlbWVudGF0
aW9uIHdoaWNoIGlzIG5vdCB1c2luZyB0aGUgY29tbW9uCj4gKyMgICAgICAgICAgICAgIGhhcmRs
b2NrdXAgY29tbWFuZCBsaW5lIG9wdGlvbnMgYW5kIHN5c2N0bCBpbnRlcmZhY2UuCj4gKyMKPiAr
IyBOb3RlIHRoYXQgSEFWRV9OTUlfV0FUQ0hET0cgaXMgdXNlZCB0byBkaXN0aW5ndWlzaCB0aGUg
c3BhcmM2NCBzcGVjaWZpYwo+ICsjIGltcGxlbWVudGFpb24uIEl0IGlzIGF1dG9tYXRpY2FsbHkg
ZW5hYmxlZCBhbHNvIGZvciBvdGhlciBhcmNoLXNwZWNpZmljCj4gKyMgdmFyaWFudHMgd2hpY2gg
c2V0IEhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9BUkNILiBJdCBtYWtlcyB0aGUgY2hlY2sKPiAr
IyBvZiBhdmFpYWxhYmxlIGFuZCBzdXBwb3J0ZWQgdmFyaWFudHMgcXVpdGUgdHJpY2t5Lgo+ICAj
Cj4gIGNvbmZpZyBIQVJETE9DS1VQX0RFVEVDVE9SCj4gICAgICAgICBib29sICJEZXRlY3QgSGFy
ZCBMb2NrdXBzIgo+ICAgICAgICAgZGVwZW5kcyBvbiBERUJVR19LRVJORUwgJiYgIVMzOTAKPiAt
ICAgICAgIGRlcGVuZHMgb24gSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX05PTl9BUkNIIHx8IEhB
VkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9BUkNICj4gKyAgICAgICBkZXBlbmRzIG9uICgoSEFWRV9I
QVJETE9DS1VQX0RFVEVDVE9SX1BFUkYgfHwgSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX0JVRERZ
KSAmJiAhSEFWRV9OTUlfV0FUQ0hET0cpIHx8IEhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9BUkNI
CgpBZGRpbmcgdGhlIGRlcGVuZGVuY3kgdG8gYnVkZHkgKHNlZSBhYmxvdmUpIHdvdWxkIHNpbXBs
aWZ5IHRoZSBhYm92ZQp0byBqdXN0IHRoaXM6CgpkZXBlbmRzIG9uIEhBVkVfSEFSRExPQ0tVUF9E
RVRFQ1RPUl9QRVJGIHx8CkhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9CVUREWSB8fCBIQVZFX0hB
UkRMT0NLVVBfREVURUNUT1JfQVJDSAoKQXMgcGVyIGFib3ZlLCBpdCdzIHNpbXBseSBhIHJlc3Bv
bnNpYmlsaXR5IG9mIGFyY2hpdGVjdHVyZXMgbm90IHRvCmRlZmluZSB0aGF0IHRoZXkgaGF2ZSBi
b3RoICJwZXJmIiBpZiB0aGV5IGhhdmUgdGhlIE5NSSB3YXRjaGRvZywgc28KaXQncyBqdXN0IGJ1
ZGR5IHRvIHdvcnJ5IGFib3V0LgoKCj4gKyAgICAgICBpbXBseSBIQVJETE9DS1VQX0RFVEVDVE9S
X1BFUkYKPiArICAgICAgIGltcGx5IEhBUkRMT0NLVVBfREVURUNUT1JfQlVERFkKPiAgICAgICAg
IHNlbGVjdCBMT0NLVVBfREVURUNUT1IKPiAtICAgICAgIHNlbGVjdCBIQVJETE9DS1VQX0RFVEVD
VE9SX05PTl9BUkNIIGlmIEhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9OT05fQVJDSAo+Cj4gICAg
ICAgICBoZWxwCj4gICAgICAgICAgIFNheSBZIGhlcmUgdG8gZW5hYmxlIHRoZSBrZXJuZWwgdG8g
YWN0IGFzIGEgd2F0Y2hkb2cgdG8gZGV0ZWN0Cj4gQEAgLTEwNTUsOSArMTA3MiwxNSBAQCBjb25m
aWcgSEFSRExPQ0tVUF9ERVRFQ1RPUgo+ICAgICAgICAgICBjaGFuY2UgdG8gcnVuLiAgVGhlIGN1
cnJlbnQgc3RhY2sgdHJhY2UgaXMgZGlzcGxheWVkIHVwb24gZGV0ZWN0aW9uCj4gICAgICAgICAg
IGFuZCB0aGUgc3lzdGVtIHdpbGwgc3RheSBsb2NrZWQgdXAuCj4KPiArIwo+ICsjIE5vdGUgdGhh
dCBhcmNoLXNwZWNpZmljIHZhcmlhbnRzIGFyZSBhbHdheXMgcHJlZmVycmVkLgo+ICsjCj4gIGNv
bmZpZyBIQVJETE9DS1VQX0RFVEVDVE9SX1BSRUZFUl9CVUREWQo+ICAgICAgICAgYm9vbCAiUHJl
ZmVyIHRoZSBidWRkeSBDUFUgaGFyZGxvY2t1cCBkZXRlY3RvciIKPiAtICAgICAgIGRlcGVuZHMg
b24gSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX1BFUkYgJiYgU01QCj4gKyAgICAgICBkZXBlbmRz
IG9uIEhBUkRMT0NLVVBfREVURUNUT1IKPiArICAgICAgIGRlcGVuZHMgb24gSEFWRV9IQVJETE9D
S1VQX0RFVEVDVE9SX1BFUkYgJiYgSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX0JVRERZCj4gKyAg
ICAgICBkZXBlbmRzIG9uICFIQVZFX05NSV9XQVRDSERPRwoKQ2FuIGdldCByaWQgb2YgYWJvdmUg
IiFIQVZFX05NSV9XQVRDSERPRyIgaWYgaXQncyBhZGRlZCB0bwpIQVZFX0hBUkRMT0NLVVBfREVU
RUNUT1JfQlVERFkuCgoKPiArICAgICAgIGRlZmF1bHQgbgoKSSdtIHByZXR0eSBzdXJlICJkZWZh
dWx0IG4iIGlzbid0IG5lZWRlZC4KCgo+ICAgICAgICAgaGVscAo+ICAgICAgICAgICBTYXkgWSBo
ZXJlIHRvIHByZWZlciB0aGUgYnVkZHkgaGFyZGxvY2t1cCBkZXRlY3RvciBvdmVyIHRoZSBwZXJm
IG9uZS4KPgo+IEBAIC0xMDcxLDM5ICsxMDk0LDI3IEBAIGNvbmZpZyBIQVJETE9DS1VQX0RFVEVD
VE9SX1BSRUZFUl9CVUREWQo+Cj4gIGNvbmZpZyBIQVJETE9DS1VQX0RFVEVDVE9SX1BFUkYKPiAg
ICAgICAgIGJvb2wKPiAtICAgICAgIGRlcGVuZHMgb24gSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9S
X1BFUkYKPiArICAgICAgIGRlcGVuZHMgb24gSEFSRExPQ0tVUF9ERVRFQ1RPUgo+ICsgICAgICAg
ZGVwZW5kcyBvbiBIQVZFX0hBUkRMT0NLVVBfREVURUNUT1JfUEVSRiAmJiAhSEFSRExPQ0tVUF9E
RVRFQ1RPUl9QUkVGRVJfQlVERFkKPiArICAgICAgIGRlcGVuZHMgb24gIUhBVkVfTk1JX1dBVENI
RE9HCgpXZSBkb24ndCByZWFsbHkgbmVlZCB0aGUgIiFIQVZFX05NSV9XQVRDSERPRyIuIEEgdXNl
ciB3b3VsZG4ndCBiZSBhYmxlCnRvIG1lc3MgdGhpcyB1cCBhbmQgaXQncyB1cCB0byBhbiBhcmNo
aXRlY3R1cmUgbm90IHRvIGRlZmluZSBib3RoCkhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9QRVJG
IGFuZCBIQVZFX05NSV9XQVRDSERPRy4KCgo+ICAgICAgICAgc2VsZWN0IEhBUkRMT0NLVVBfREVU
RUNUT1JfQ09VTlRTX0hSVElNRVIKPgo+ICBjb25maWcgSEFSRExPQ0tVUF9ERVRFQ1RPUl9CVURE
WQo+ICAgICAgICAgYm9vbAo+IC0gICAgICAgZGVwZW5kcyBvbiBTTVAKPiArICAgICAgIGRlcGVu
ZHMgb24gSEFSRExPQ0tVUF9ERVRFQ1RPUgo+ICsgICAgICAgZGVwZW5kcyBvbiBIQVZFX0hBUkRM
T0NLVVBfREVURUNUT1JfQlVERFkKPiArICAgICAgIGRlcGVuZHMgb24gIUhBVkVfSEFSRExPQ0tV
UF9ERVRFQ1RPUl9QRVJGIHx8IEhBUkRMT0NLVVBfREVURUNUT1JfUFJFRkVSX0JVRERZCj4gKyAg
ICAgICBkZXBlbmRzIG9uICFIQVZFX05NSV9XQVRDSERPRwoKR2V0IHJpZCBvZiAiIUhBVkVfTk1J
X1dBVENIRE9HIiBhbmQgaXQgc2hvdWxkIGJlIGluCkhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9C
VUREWQoKCk92ZXJhbGwsIHRob3VnaCwgSSBhZ3JlZSB0aGF0IHRoaXMgaW1wcm92ZXMgdGhpbmdz
ISBUaGFua3MhIDotKQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8va2dkYi1idWdyZXBvcnQK
