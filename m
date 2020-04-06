Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7421A9B74
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 15 Apr 2020 12:54:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jOfgN-0004K4-0z
	for lists+kgdb-bugreport@lfdr.de; Wed, 15 Apr 2020 10:54:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <anup@brainfault.org>) id 1jLJcl-0006A2-1M
 for kgdb-bugreport@lists.sourceforge.net; Mon, 06 Apr 2020 04:44:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5fs8V2Zn1S9zGMZnOpQlB2LD5nbEtasIOqLpHPCwiF4=; b=PWZ0t5Pupkf+4lkPzI+5ttFV70
 TwyO/EFRiD/CvD5ZsRMbJxpjZ8gsna+iNaNjfptBLU/pCv+1Z/WL2TVSGP+zqk5cy53CbHzPol2LT
 W9TNFUjsyjtpuk60m+Zeqwsy54+P0s4ey6PATUEwfJyKjhe9bsqY8ibC+c/CdOzkekBs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5fs8V2Zn1S9zGMZnOpQlB2LD5nbEtasIOqLpHPCwiF4=; b=Oa0UjJ276Kj9A06FJKwPT3pPr/
 SUcSsKHMjJGyCuWdccL+4wER16zXByRPeHMfWzwM36wHVAWGRrCJWMpynPBNqehPCfA4XBnNEG0Ej
 /Wzhyk1nXnLz3DvMvrvQTzNdMGUr7ilOE1PVBsNnyfxImLViuVSaXAjeip3r0sG+bZvw=;
Received: from mail-wr1-f65.google.com ([209.85.221.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jLJcf-008yVg-OD
 for kgdb-bugreport@lists.sourceforge.net; Mon, 06 Apr 2020 04:44:38 +0000
Received: by mail-wr1-f65.google.com with SMTP id a25so15780726wrd.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sun, 05 Apr 2020 21:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5fs8V2Zn1S9zGMZnOpQlB2LD5nbEtasIOqLpHPCwiF4=;
 b=DsjKRJHo06SKxuU52auqO0c/LG1SKBUikqb1/Q7mizWmpqWCXMN5TGWKrOWysLnHs7
 muqbgr8xn17fqGpVoS/mtNq9Hr76tM0CuT8/JeM/MDGNGE4tCMbdNr293Cax0gbihVqZ
 j3ffoFft07axbqJ5r7iCKfvTqE+DbURmjKtECH8TNzXFZiruCNQQ11FwPc25EBpNZB/N
 gPzC1XLlYtVyEtz2/MODlpapUayaILCxg2I3z0BiDB+DdqzGJNJCyjiF2aqdxT/hCh13
 V8gOCYCzr4/UdChLf5NJTyOQ8lR4+MP9g2NHfNuXYbRK+ZTfEZnuH116z/Ac9IlaJG6B
 kIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5fs8V2Zn1S9zGMZnOpQlB2LD5nbEtasIOqLpHPCwiF4=;
 b=LXafpeptkgtt/k162qQ3ALuCfOzbzT3LHmU3K+/wUql51oNAnJyb4kGGBrk6E+aV0V
 n+ZsaW2fbOU0MP7FUEbHZOruLZWkoB+Z7v9YRXihKKkqYMneE31NA58U34WS086jNLP7
 o07l2T9Gh0gM0qjL33zXDy/sF2F5p14HnJt1nI1UGp8it7zZYLk/Gy8M7dsXgOJzN+kb
 caZD/O7boTie4wI0VLag5gMV5uo9QEBWXrjbZVR2rXXhGdFmLkAYfY7bjGP49vPMRSQb
 /LINqibhkf2g8qBtWjIj3LorKFZc3P4r0GPGidor0RaU09BBohQKsVdddtaAApF98ydj
 6frg==
X-Gm-Message-State: AGi0PuZdqPDiVa258LSjuOYSaYufzLCVIl9tHe6Sedz/u/p7xqAq/niU
 P9FLxXQFQovRmi37S/7l2DTceRjdCJtfLgY5eBUFH9z2yP0=
X-Google-Smtp-Source: APiQypIEVIXYcLTNFkSmMnccjhMek5oxofAXzoAZMb3vteVecGxBjtpLwThLMooTjxz1LZ3XCI8nKm7xYf6htPlFt74=
X-Received: by 2002:a5d:684c:: with SMTP id o12mr3369396wrw.0.1586146485309;
 Sun, 05 Apr 2020 21:14:45 -0700 (PDT)
MIME-Version: 1.0
References: <1585668191-16287-1-git-send-email-vincent.chen@sifive.com>
 <20200403101227.74abwoyxzx4rlake@holly.lan>
 <CABvJ_xh2pocd1xywyZ_4VQbs8eFO6ehQfsRkQTpdTDUJXbsXEg@mail.gmail.com>
In-Reply-To: <CABvJ_xh2pocd1xywyZ_4VQbs8eFO6ehQfsRkQTpdTDUJXbsXEg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 6 Apr 2020 09:44:33 +0530
Message-ID: <CAAhSdy2h0BsSQjL25tTZRx2JV1fnpnW9RgSO6keXopBJaJCsZw@mail.gmail.com>
To: Vincent Chen <vincent.chen@sifive.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: sifive.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.65 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.65 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jLJcf-008yVg-OD
X-Mailman-Approved-At: Wed, 15 Apr 2020 10:54:12 +0000
Subject: Re: [Kgdb-bugreport] [PATCH v2 0/5] riscv: Add KGDB and KDB support
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net, jason.wessel@windriver.com,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Apr 6, 2020 at 8:05 AM Vincent Chen <vincent.chen@sifive.com> wrote:
>
> On Fri, Apr 3, 2020 at 6:12 PM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > On Tue, Mar 31, 2020 at 11:23:06PM +0800, Vincent Chen wrote:
> > > This patch set implements required ports to enable RISC-V kernel to support
> > > KGDB and KDB features. Because there is no immediate value in the RISC-V
> > > trap instruction, the kernel cannot identify the purpose of each trap
> > > exception through the opcode. This makes the existing identification
> > > schemes in other architecture unsuitable for the RISC-V kernel. In order
> > > to solve this problem, this patch adds the kgdb_has_hit_break() to kgdb.c
> > > to help the RISC-V kernel identify the KGDB trap exception. In addition,
> > > the XML target description was introduced in this patch set to enable KGDB
> > > to report the contents of the status, cause and steal registers.
> > >
> > > This patchset has passed the kgdbts test suite provided by Linux kernel on
> > > HiFive unleashed board and QEMU.
> >
> > Can you share the defconfig and qemu boot lines used for testing.
> >
> > I'd like to see if they can easily be integrated into kgdbtest. Normally
> > figuring out the qemu boot line is the hardest bit of adding support for
> > an architecture one is not familar with.
> >
> The process of building a RISC-V kernel is a bit different from other
> architecture. Maybe you can refer the steps in
> https://risc-v-getting-started-guide.readthedocs.io/en/latest/linux-qemu.html
> to build the kernel image and run it.
>
> For the Linux configuration used by KGDB, I just enable KGDB related
> configuration based on riscv defconfig. The riscv defconfig can
> founded in arch/riscv/configs/defconfig
>
> The QEMU boot lines are listed in the following.
>
> qemu-system-riscv64 -M virt -m 256M -nographic \
> -kernel <bbl image>\
> -append "debug root=/dev/vda rw console=ttyS0" \
> -drive file=<root file system>,format=raw,id=hd0 \
> -serial tcp:localhost:2345,server \
> -gdb tcp::1133 \
> -device virtio-blk-device,drive=hd0 \

Majority of folks (including distros) have moved to OpenSBI instead
of BBL. In fact, QEMU releases ship with OpenSBI as default M-mode
firmware.

To boot Linux on QEMU Virt with OpenSBI as M-mode firmware refer:
https://github.com/riscv/opensbi/blob/master/docs/platform/qemu_virt.md

Regards,
Anup


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
