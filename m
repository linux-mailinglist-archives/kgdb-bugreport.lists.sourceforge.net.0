Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D0B72731F
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  8 Jun 2023 01:37:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q72im-00087n-EK
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 07 Jun 2023 23:37:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q72il-00087f-3t
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 07 Jun 2023 23:37:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EN7QCcXv3GhQ50KYCOkYuc7v8/KdYJA2Wdn7x5ACZBs=; b=We8N8vVu6HaLjVVv5IuDPiwKsl
 g5lZ/4eMK9CxeoFxiXICsKaZJLMH1jeea3ABPM0S+WMo3vf7Asv0rcR/J8KQDpRmED3V9feY88oEL
 HG6mApMJeVYNehgKXsn6BM1YVGnfQKCOvfflD4mjuDTfQdniquTmfKffXhLmhOBbHN4U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EN7QCcXv3GhQ50KYCOkYuc7v8/KdYJA2Wdn7x5ACZBs=; b=Ws8uKab12XJmCEXQGz7NsEv1v+
 zpGNCzHfWJ9Pd4Mjil1/lpZCpymvxBdT0VFhWDbAGQJ1q+vYKfos8VIg0Ka2R2OJPhNGUVTMZfVEP
 0dba0yRKTROFp9COYRz4A5nSIrmeZeCZBQ+dVyZi7QhpRluAzPvDxVNLcqD3pPGxSOS4=;
Received: from mail-io1-f49.google.com ([209.85.166.49])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q72ij-00E9wr-E6 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 07 Jun 2023 23:37:43 +0000
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-777b4c9e341so206236639f.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 07 Jun 2023 16:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686181055; x=1688773055;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EN7QCcXv3GhQ50KYCOkYuc7v8/KdYJA2Wdn7x5ACZBs=;
 b=j7P34YHOYHXEN5m6sprm1z9RILqU45cM7iBZf0UUjkLN1Z8TxMe0YIqzljyllJP9ST
 fYCIbYR3iz8BZ5MSlJeSjjWgcEsLHQnEq4teh4pJEa3UXp/iCGFoHb5zOeC1XYxEkZMM
 6V9aevVsYko4O4sbDW2MpZ5T2WuA3Ec5vQy9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686181055; x=1688773055;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EN7QCcXv3GhQ50KYCOkYuc7v8/KdYJA2Wdn7x5ACZBs=;
 b=D0ENbwyPrgJiM0PjaxZLQsAJ8N1+gWQ7bi02KSP6n0qg8vLl8KhJL4qPOvfLGHZNvt
 GqreAbaQCL2XRS4Tc84BXtLOBlJiEcHNMP0/NjjcyDUWRPUEyOZTe9KxhlcxZHUiXrJB
 PmpBtLgd/cncdeCY4e3KNxdUCpPQR9vGu4F8/UVGNY+LeKoEZni1cJIKeRQ+XsXMa090
 o3es3imzQtaPxiKSdf7aMbwC2fNf0EXbB17+Q0Krg6klkVCsoiqZMLW+I2+OsWdk3eb/
 JB/jSbo1JFbzKgKn1z64uXVQPLs81sP1L7IgvBPkD+UMCYjv4jyeoAHenJNP0t4c3d0i
 5fOQ==
X-Gm-Message-State: AC+VfDwb07qY8f1iX8nLcppoccbKXwmjPyjyQhGGyl13CpfEOJRss/fn
 LrV9EotXH89mTiqfmdle/lTh3XAVySoazbX+0eU=
X-Google-Smtp-Source: ACHHUZ4YpNvFe7tgOz8me4L1NpmlGJH1Zc7N0mJ2tC9kHAElnU5z6M3RtLJT520gcxw7iH3kVaJIDQ==
X-Received: by 2002:a05:6602:218c:b0:769:8933:3c7f with SMTP id
 b12-20020a056602218c00b0076989333c7fmr10590913iob.9.1686181055242; 
 Wed, 07 Jun 2023 16:37:35 -0700 (PDT)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com.
 [209.85.166.177]) by smtp.gmail.com with ESMTPSA id
 h8-20020a02cd28000000b00411af6e8091sm3857738jaq.66.2023.06.07.16.37.32
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jun 2023 16:37:34 -0700 (PDT)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-33d928a268eso54805ab.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 07 Jun 2023 16:37:32 -0700 (PDT)
X-Received: by 2002:a92:c54d:0:b0:33e:6b65:6f78 with SMTP id
 a13-20020a92c54d000000b0033e6b656f78mr16557ilj.27.1686181051931; Wed, 07 Jun
 2023 16:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230607152432.5435-1-pmladek@suse.com>
In-Reply-To: <20230607152432.5435-1-pmladek@suse.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 7 Jun 2023 16:37:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W=xamTf6BUmp-Yg-SEEgE8GRKw6Pnfv6t=Hviywj-N-g@mail.gmail.com>
Message-ID: <CAD=FV=W=xamTf6BUmp-Yg-SEEgE8GRKw6Pnfv6t=Hviywj-N-g@mail.gmail.com>
To: Petr Mladek <pmladek@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Wed, Jun 7, 2023 at 8:25 AM Petr Mladek <pmladek@suse.com>
    wrote: > > Hi, > > this patchset is supposed to replace the last patch in
    the patchset cleaning > up after introducing the buddy detecto [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.166.49 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.166.49 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q72ij-00E9wr-E6
Subject: Re: [Kgdb-bugreport] [PATCH 0/7] watchdog/hardlockup: Cleanup
 configuration of hardlockup detectors
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
a0BzdXNlLmNvbT4gd3JvdGU6Cj4KPiBIaSwKPgo+IHRoaXMgcGF0Y2hzZXQgaXMgc3VwcG9zZWQg
dG8gcmVwbGFjZSB0aGUgbGFzdCBwYXRjaCBpbiB0aGUgcGF0Y2hzZXQgY2xlYW5pbmcKPiB1cCBh
ZnRlciBpbnRyb2R1Y2luZyB0aGUgYnVkZHkgZGV0ZWN0b3IsIHNlZQo+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL3IvMjAyMzA1MjYxODQxMzkuMTAuSTgyMWZlNzYwOWU1NzYwODkxM2ZlMDVhYmQ4
ZjM1YjM0M2U3YTlhYWVAY2hhbmdlaWQKCkkgd2lsbCBsZXQgQW5kcmV3IGNoaW1lIGluIHdpdGgg
aGlzIHByZWZlcmVuY2UsIGJ1dCBzbyBmYXIgSSBoYXZlbid0CnNlZW4gaGltIGRyb3BwaW5nIGFu
ZC9vciBtb2RpZnlpbmcgYW55IHBhdGNoZXMgdGhhdCBoZSdzIHBpY2tlZCB1cCBpbgp0aGlzIHNl
cmllcy4gSSBzZWUgdGhhdCBoZSdzIGFscmVhZHkgcGlja2VkIHVwIHRoZSBwYXRjaCB0aGF0IHlv
dSdyZQoicmVwbGFjaW5nIi4gSSB3b25kZXIgaWYgaXQgd291bGQgYmUgZWFzaWVyIGZvciBoaW0g
aWYgeW91IGp1c3QgYnVpbHQKYXRvcCB0aGF0PwoKLURvdWcKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QK
S2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
