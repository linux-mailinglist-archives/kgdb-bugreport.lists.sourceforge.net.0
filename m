Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 128B7249875
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 19 Aug 2020 10:46:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k8JjU-0005K3-CS
	for lists+kgdb-bugreport@lfdr.de; Wed, 19 Aug 2020 08:46:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <geert.uytterhoeven@gmail.com>) id 1k8JjS-0005Jv-LA
 for kgdb-bugreport@lists.sourceforge.net; Wed, 19 Aug 2020 08:46:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XdMqBN+JWRM3G+IheoRLVYzYd5VMn/6BP5p9HfMMJL0=; b=RMAMKJM5JdeJHDsKsbpL+0KnlK
 c9PMC0HVrc1gdmriQz7KeIQeLpRFdjcD4+hXbwGt3vllcM1PgG/B9dNkn54ht1/CogvpLSKEjiSDj
 jj8xfwlBex2dkDxg2pEC2YaCdcBQsM88lQeQqf1CypAG9sgTaOMlztuzYbIXEoiD/dzY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XdMqBN+JWRM3G+IheoRLVYzYd5VMn/6BP5p9HfMMJL0=; b=e1Rog7TXx28zNhuT3PClmuOkfH
 l4RjmkyPSiOl7q/HBw6YZCTVMG5cccDAC6E76YphR5610aFJ2eRfMvhP+1kjXTUPhpjZ7ZZYqSaKX
 +UrZEPbp2R86U/5s7guo4yUH5muAJOQPGQ2VfmW1i5RqA7Mjuc4CnyyT5lH6YPyxvUfY=;
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k8JjQ-00FvDm-Li
 for kgdb-bugreport@lists.sourceforge.net; Wed, 19 Aug 2020 08:46:06 +0000
Received: by mail-ot1-f67.google.com with SMTP id q9so18456121oth.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 19 Aug 2020 01:46:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XdMqBN+JWRM3G+IheoRLVYzYd5VMn/6BP5p9HfMMJL0=;
 b=qBN0+0O5K81mz+12Vw6TyaCZXL8Z3qzOZQdcZ+nQkz54mT4tz0D0LXyeoJF5okJt4v
 3PN56VrTdAw2MD+K5oGda0FuURkCrT2V4zVR3yiUsHxrsWyb1H+txLIMh/2eByZ2R9sL
 XLOU2kPXVOrI7rnZh8UixOQ06XkEsdK4mKmCsaDdmLUGQbCZ8kITRqqxUS+ehdzGUwmW
 8cUOcBRAywsQsg1GsD4ppHbERoLTnUosQQGUHsqcraPAPddddnX6t7qpaEiW/Og1pH2P
 af2vaGzJROHEJWMP/naAkEzS0JVXV+16khD9xemrijMsa00SuyyCcukwNBtqJJ16x2ub
 69Cg==
X-Gm-Message-State: AOAM531vX5SL0qM4YXzunQPN20bUICKsVgcFbnE0giZIKb3r35ZhFLQp
 ZnvksCj5N+hd5/HS4uZNLvzMwx6lwGyEpm9N4Nk=
X-Google-Smtp-Source: ABdhPJxffhcpNuckQ4mnV1k375oB5tRtMtmjGJuWn9QXsoz5JxTE5b8Ui9kNypxBpadfClKdMNUuL/i01XobtQhnI0M=
X-Received: by 2002:a05:6830:1b79:: with SMTP id
 d25mr16575680ote.107.1597826759120; 
 Wed, 19 Aug 2020 01:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200818173411.404104-1-christian.brauner@ubuntu.com>
 <20200818173411.404104-5-christian.brauner@ubuntu.com>
In-Reply-To: <20200818173411.404104-5-christian.brauner@ubuntu.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Aug 2020 10:45:47 +0200
Message-ID: <CAMuHMdUPtAT_b72WT_SYWr-M7uq=RucgnbJghTUj+YU8PVdcYQ@mail.gmail.com>
To: Christian Brauner <christian.brauner@ubuntu.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (geert.uytterhoeven[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux-m68k.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.67 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.67 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 -0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k8JjQ-00FvDm-Li
Subject: Re: [Kgdb-bugreport] [PATCH 04/11] m68k: switch to kernel_clone()
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
Cc: Alexandre Chartre <alexandre.chartre@oracle.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Kars de Jong <jongk@linux-m68k.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Linux-Arch <linux-arch@vger.kernel.org>,
 Tom Zanussi <zanussi@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Christoph Hewllig <hch@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>,
 Fenghua Yu <fenghua.yu@intel.com>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Xiao Yang <yangx.jy@cn.fujitsu.com>, Tony Luck <tony.luck@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Aug 18, 2020 at 7:37 PM Christian Brauner
<christian.brauner@ubuntu.com> wrote:
> The old _do_fork() helper is removed in favor of the new kernel_clone() helper.
> The latter adheres to naming conventions for kernel internal syscall helpers.
>
> Cc: Kars de Jong <jongk@linux-m68k.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: linux-m68k@lists.linux-m68k.org
> Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
