Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D37364C9726
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  1 Mar 2022 21:42:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nP9Jz-0001mE-SV
	for lists+kgdb-bugreport@lfdr.de; Tue, 01 Mar 2022 20:42:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <torvalds@linuxfoundation.org>) id 1nP9Jy-0001m5-OS
 for kgdb-bugreport@lists.sourceforge.net; Tue, 01 Mar 2022 20:42:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rAZcpGOFnijhfBt719P+IqprCBqe8sD9TF0Sez9IwiQ=; b=iQ7uUDnv9SQFWNg++SbqcHSyGq
 ox1tJoU+XlsXzDjZQvDYXFCGqkYG/VVKC/3654HpUPNCQKVqP3su4Ln806GNzNT1LRznOFaxCtfCD
 xt9DYFBhXy58xXKh3++blMFoIivYWtt+X6kQqfNayqGPQKDH3NPpfJr48rX8u0CDVAuM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rAZcpGOFnijhfBt719P+IqprCBqe8sD9TF0Sez9IwiQ=; b=IS2+T5kd8mZaBc4qsZlm/886eU
 gwu9pSO5qbNsah2V3rvrtAKlTYjiPG3JVQlUdhqcBrKJIa35H4FsrblRgr+OqI5b0pSk40x30Dnh9
 xZ8oj0txxHAUGYT3snDCsq+iuvX7jx7eIWvKzwL0Jyi2kuQzleGfJzZqUeKoXmygRTAI=;
Received: from mail-ed1-f43.google.com ([209.85.208.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nP9Jr-00063c-ML
 for kgdb-bugreport@lists.sourceforge.net; Tue, 01 Mar 2022 20:42:09 +0000
Received: by mail-ed1-f43.google.com with SMTP id q17so23609280edd.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 01 Mar 2022 12:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rAZcpGOFnijhfBt719P+IqprCBqe8sD9TF0Sez9IwiQ=;
 b=F+7BPGYsO9QeRc6BTbvPUJxguXCTYika7fzNVLbSEfMjTVK29FjvhOtCtbBO2oalkB
 9cweHARFFeQAeiDWhTrtcdfTzbCEOfTOrVCN9rTTV3Ek5jpvIVUt3aua8OA61CgDhA1w
 zQABsshAfnGl6gFdFI9HcnnKU8AOre3uWnEew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rAZcpGOFnijhfBt719P+IqprCBqe8sD9TF0Sez9IwiQ=;
 b=A9P+uaRwWkW8qyoSlva62AG0j2Fp4CspmXuhVzWuyd/oSmLebY6m9hgntulgfry1Mi
 Fisxkmv61qejTUV+0EFPzsVglpWshQtGA84s8ZOp2Pm3J80/nY/2WJe4O2ypK7BurzjC
 wXmqOa9EpuphaDzzHrTzR1IGBq38e0F2MQQ1i9Wyg5+6YcIOXzOin5aaujjm2S2afYVE
 izO7mV8lLAxmnkzlk8FFFUWEO+5PnUBYNjlgK/8fG9VOGdG4zyMaw8512JwakL0AseP5
 ZYz45yawZu3TmqErcva4IPlsAlNSaphrgsiLzJot3qLmuafjm/D5DTyfNMCoiA1Oezm5
 Ue3A==
X-Gm-Message-State: AOAM531G2MyFIbo3NMuqI/VWQO8wZ4jGN2Nt78CL6bqzQr6yCNXX74HE
 Oezw7/QsX+Lnn/WqrDPdQAEuGNbqg7/iTLPyLOk=
X-Google-Smtp-Source: ABdhPJx7/d3xhx+g8fU3PfgL326W/f2AEnJaUcsXQZgvwDcuTIlnbR++WfFzK2Jb0u7p/mLyIvNy+A==
X-Received: by 2002:a05:6402:349:b0:410:a0bd:35ad with SMTP id
 r9-20020a056402034900b00410a0bd35admr26335631edw.12.1646167316934; 
 Tue, 01 Mar 2022 12:41:56 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com.
 [209.85.221.52]) by smtp.gmail.com with ESMTPSA id
 m13-20020a170906234d00b006cf86bb0652sm5618720eja.121.2022.03.01.12.41.56
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 12:41:56 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id bk29so5067449wrb.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 01 Mar 2022 12:41:56 -0800 (PST)
X-Received: by 2002:ac2:44a4:0:b0:445:8fc5:a12a with SMTP id
 c4-20020ac244a4000000b004458fc5a12amr10608648lfm.27.1646166980002; Tue, 01
 Mar 2022 12:36:20 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-7-jakobkoschel@gmail.com>
In-Reply-To: <20220228110822.491923-7-jakobkoschel@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 1 Mar 2022 12:36:03 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgLtKofBbn9kSXRU3MpdX7S2OxN1V5Mc679oJpFnp_VnQ@mail.gmail.com>
Message-ID: <CAHk-=wgLtKofBbn9kSXRU3MpdX7S2OxN1V5Mc679oJpFnp_VnQ@mail.gmail.com>
To: Jakob Koschel <jakobkoschel@gmail.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  So looking at this patch, I really reacted to the fact that
 quite often the "use outside the loop" case is all kinds of just plain
 unnecessary, 
 but _used_ to be a convenience feature. I'll just quote the first chunk in
 it's entirely as an example - not because I think this chunk is particularly
 important, but because it's a good example: 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.43 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.43 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nP9Jr-00063c-ML
Subject: Re: [Kgdb-bugreport] [PATCH 6/6] treewide: remove check of list
 iterator against head past the loop body
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
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, samba-technical@lists.samba.org,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 KVM list <kvm@vger.kernel.org>, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev, "Bos,
 H.J." <h.j.bos@vu.nl>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 linux-block <linux-block@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 v9fs-developer@lists.sourceforge.net,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sgx@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, Netdev <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org, linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 tipc-discussion@lists.sourceforge.net,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 dma <dmaengine@vger.kernel.org>, linux-mediatek@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

So looking at this patch, I really reacted to the fact that quite
often the "use outside the loop" case is all kinds of just plain
unnecessary, but _used_ to be a convenience feature.

I'll just quote the first chunk in it's entirely as an example - not
because I think this chunk is particularly important, but because it's
a good example:

On Mon, Feb 28, 2022 at 3:09 AM Jakob Koschel <jakobkoschel@gmail.com> wrote:
>
> diff --git a/arch/arm/mach-mmp/sram.c b/arch/arm/mach-mmp/sram.c
> index 6794e2db1ad5..fc47c107059b 100644
> --- a/arch/arm/mach-mmp/sram.c
> +++ b/arch/arm/mach-mmp/sram.c
> @@ -39,19 +39,22 @@ static LIST_HEAD(sram_bank_list);
>  struct gen_pool *sram_get_gpool(char *pool_name)
>  {
>         struct sram_bank_info *info = NULL;
> +       struct sram_bank_info *tmp;
>
>         if (!pool_name)
>                 return NULL;
>
>         mutex_lock(&sram_lock);
>
> -       list_for_each_entry(info, &sram_bank_list, node)
> -               if (!strcmp(pool_name, info->pool_name))
> +       list_for_each_entry(tmp, &sram_bank_list, node)
> +               if (!strcmp(pool_name, tmp->pool_name)) {
> +                       info = tmp;
>                         break;
> +               }
>
>         mutex_unlock(&sram_lock);
>
> -       if (&info->node == &sram_bank_list)
> +       if (!info)
>                 return NULL;
>
>         return info->gpool;

I realize this was probably at least auto-generated with coccinelle,
but maybe that script could be taught to do avoid the "use after loop"
by simply moving the code _into_ the loop.

IOW, this all would be cleaner and clear written as

        if (!pool_name)
                return NULL;

        mutex_lock(&sram_lock);
        list_for_each_entry(info, &sram_bank_list, node) {
                if (!strcmp(pool_name, info->pool_name)) {
                        mutex_unlock(&sram_lock);
                        return info;
                }
        }
        mutex_unlock(&sram_lock);
        return NULL;

Ta-daa - no use outside the loop, no need for new variables, just a
simple "just do it inside the loop". Yes, we end up having that lock
thing twice, but it looks worth it from a "make the code obvious"
standpoint.

Would it be even cleaner if the locking was done in the caller, and
the loop was some simple helper function? It probably would. But that
would require a bit more smarts than probably a simple coccinelle
script would do.

                Linus


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
