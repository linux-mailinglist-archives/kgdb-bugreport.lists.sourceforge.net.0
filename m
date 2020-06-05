Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEB71EF020
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 Jun 2020 05:58:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jh3UW-0002vz-Ok
	for lists+kgdb-bugreport@lfdr.de; Fri, 05 Jun 2020 03:58:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sergey.senozhatsky@gmail.com>) id 1jh3UV-0002vl-Rq
 for kgdb-bugreport@lists.sourceforge.net; Fri, 05 Jun 2020 03:57:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:Date:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6O/8gP+vgsM1SKUrwazGqcFhGPsWzja2ClLLpPozZZ0=; b=Nv35/A+INnRwd1pErXalLfQx3p
 SPNPjPkbknH7Qtu62R4caVSkd7SisvVcSqDv1sii6vWlbLaNOk08VfUgjDfdKuhA1inKxbiyX4sLG
 WWnO4oSH2Eo8MFoRlzJFAj9jufUG6JkMW8F0cuCWSJjhaHHn8pT+2ad4qVRSizMfmezc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :Date:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6O/8gP+vgsM1SKUrwazGqcFhGPsWzja2ClLLpPozZZ0=; b=l8tFW08MBK3KcqEHjyxTVQaRhO
 DwJZTItj5FqNYFxjuPvY2iggZFxOEYqE4fr3/em5PRsLKMd1Trc2g/ReZGlUXbZy+MUBiOVNBN9g4
 o+qT+PRY1ZxOIumn5cs/uz4veAZRVsc7SP/yYVRs9EJSKsBq/LLLj5b3axM72q3CK/u4=;
Received: from mail-pf1-f194.google.com ([209.85.210.194])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jh3UR-00COTY-DW
 for kgdb-bugreport@lists.sourceforge.net; Fri, 05 Jun 2020 03:57:59 +0000
Received: by mail-pf1-f194.google.com with SMTP id x22so4294331pfn.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 Jun 2020 20:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6O/8gP+vgsM1SKUrwazGqcFhGPsWzja2ClLLpPozZZ0=;
 b=ijpJNkg9fDCN3j5YOJyLDE7fBzvOwycQs3qssuh7zjEQEU6gYyIcf2y5TH51eY9Ptt
 Rn0+SL7laU1try4AFFixoqpU4IESfaOZbxku2+d1FAUbw7j8WPF4AIIIZNO0JNurjEuh
 Q/aMTXW+pakQr0XBUMVoGOv6NlRDBkuANKe/PtkVyp0JVsoROOW/iZM468gGS7uHRy6v
 r5KBDmazwTmr5MdRz4uj9Pcq428NX9q4X9kKDGAa1tuw2gAzgPkFXyeijSgAUgHCnex0
 3ObylMcwSjpnHVwlzVydaVMYlf9HpRJxHF2pdVeLpHaodptmFXecR5+dG5od8xlJOuAb
 aTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6O/8gP+vgsM1SKUrwazGqcFhGPsWzja2ClLLpPozZZ0=;
 b=Q7SELGqIbY06tHI6WbhT+gSbZY0CRYPyrG/1U/yMGh1qrQ1wWvBQpGq1z/kLjZCcYH
 1xdEgYhCGTBZyuykGi5CKvHLADrHi6pu4amzm0KUKlhQ3Hg5rRmtgQmRMbelqil/SYHq
 WXQG9sKsVDg8lDCHQxHCq4aSeZQN5LzssHKlu++YCsNpmF6q0TCS/OQ0R25gRLlMif1S
 +obgXlfBChtBohOfDy6/vn4HjxEStVnBJqCyXVXzRv7i1m1EsQO9HRbtGgu7zZ+mycw2
 8i5w58ZcMzONDJUVdtEdIJheyYY/CpLzt6eVicEE1jkLjuhCh9qIMWFk1zVLgnwjA0eV
 BiIQ==
X-Gm-Message-State: AOAM532oFf0tm0XmQLHRO4vrs5ADlcNeSHJSAy5M6bvmYSo2YynUTByi
 hQ1H5S4+O/vpc0i5EolTY40=
X-Google-Smtp-Source: ABdhPJzzTafB2YWWaTrbUBiaJU7TnJmGUJpOILTnnW8ul9uoHfUzDLABsGjVW7jGHUBGYup9clzaqQ==
X-Received: by 2002:a65:458e:: with SMTP id o14mr4678079pgq.87.1591329462561; 
 Thu, 04 Jun 2020 20:57:42 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
 by smtp.gmail.com with ESMTPSA id n189sm3853211pfn.108.2020.06.04.20.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 20:57:41 -0700 (PDT)
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date: Fri, 5 Jun 2020 12:57:39 +0900
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200605035739.GA525@jagdpanzerIV.localdomain>
References: <1591264879-25920-1-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1591264879-25920-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (sergey.senozhatsky[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.194 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jh3UR-00COTY-DW
Subject: Re: [Kgdb-bugreport] [PATCH v6 0/4] kdb: Improve console handling
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
Cc: pmladek@suse.com, daniel.thompson@linaro.org, gregkh@linuxfoundation.org,
 kgdb-bugreport@lists.sourceforge.net, jslaby@suse.com,
 linux-kernel@vger.kernel.org, sergey.senozhatsky@gmail.com,
 jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On (20/06/04 15:31), Sumit Garg wrote:
> 
>  drivers/tty/serial/kgdb_nmi.c |  2 +-
>  drivers/tty/serial/kgdboc.c   | 32 +++++++++----------
>  drivers/usb/early/ehci-dbgp.c |  3 +-
>  include/linux/kgdb.h          |  5 ++-
>  kernel/debug/kdb/kdb_io.c     | 72 ++++++++++++++++++++++++++-----------------
>  5 files changed, 64 insertions(+), 50 deletions(-)

Reviewed-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

	-ss


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
